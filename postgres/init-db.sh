#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE TABLE IF NOT EXISTS users (
      id uuid not null primary key,
      name varchar not null
    );

    CREATE TABLE IF NOT EXISTS posts (
      id uuid not null primary key,
      user_id uuid not null,
      subject varchar not null,
      content varchar not null
    );
EOSQL
