library(rquery)


### Name: describe_tables
### Title: Build a nice description of a table.
### Aliases: describe_tables

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  ex <- example_employee_date(my_db)
  print(describe_tables(my_db, ex$tableName,
                         keyInspector = key_inspector_sqlite))
  DBI::dbDisconnect(my_db)
}





