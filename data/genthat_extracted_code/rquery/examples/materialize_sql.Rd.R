library(rquery)


### Name: materialize_sql
### Title: Materialize a user supplied SQL statement as a table.
### Aliases: materialize_sql

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  d <- rq_copy_to(my_db, 'd',
                   data.frame(AUC = 0.6, R2 = 0.2),
                   temporary = TRUE, overwrite = TRUE)
  t <- materialize_sql(my_db, "SELECT AUC, R2, AUC - R2 AS d FROM d")
  print(t)
  print(execute(my_db, t))

  DBI::dbDisconnect(my_db)
}




