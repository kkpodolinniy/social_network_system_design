CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "description" varchar,
  "images" text[],
  "latitude" float,
  "longitude" float,
  "place_name" varchar,
  "place_address" varchar,
  "created_at" timestamp
);

CREATE TABLE "comments" (
  "id" integer PRIMARY KEY,
  "post_id" integer,
  "user_id" integer,
  "comment" text,
  "created_at" timestamp
);

CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "avatar_url" varchar
);

CREATE TABLE "likes" (
  "user_id" integer,
  "post_id" integer,
  "created_at" timestamp,
  PRIMARY KEY ("user_id", "post_id")
);

CREATE TABLE "subscriptions" (
  "subscriber_id" integer,
  "target_user_id" integer,
  "created_at" timestamp,
  PRIMARY KEY ("subscriber_id", "target_user_id")
);

COMMENT ON COLUMN "posts"."images" IS 'Array of image URLs';

COMMENT ON COLUMN "posts"."latitude" IS 'Широта для карт';

COMMENT ON COLUMN "posts"."longitude" IS 'Долгота для карт';

COMMENT ON COLUMN "posts"."place_name" IS 'Название места (кэш)';

COMMENT ON COLUMN "posts"."place_address" IS 'Адрес места (кэш)';

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "subscriptions" ADD FOREIGN KEY ("subscriber_id") REFERENCES "users" ("id");

ALTER TABLE "subscriptions" ADD FOREIGN KEY ("target_user_id") REFERENCES "users" ("id");
