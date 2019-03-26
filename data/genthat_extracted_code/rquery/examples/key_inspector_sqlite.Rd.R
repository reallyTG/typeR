library(rquery)


### Name: key_inspector_sqlite
### Title: Return all primary key columns as guess at preferred primary
###   keys for a SQLite handle.
### Aliases: key_inspector_sqlite

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  DBI::dbExecute(my_db, "
    CREATE TABLE orgtable (
      eid TEXT,
      date INTEGER,
      dept TEXT,
      location TEXT,
    PRIMARY KEY (eid, date)
    )
    ")
  print(key_inspector_sqlite(my_db, "orgtable"))
  DBI::dbDisconnect(my_db)
}




