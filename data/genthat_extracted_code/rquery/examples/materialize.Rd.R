library(rquery)


### Name: materialize
### Title: Materialize an optree as a table.
### Aliases: materialize

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  d <- rq_copy_to(my_db, 'd',
                   data.frame(AUC = 0.6, R2 = 0.2),
                   temporary = TRUE, overwrite = TRUE)
  optree <- extend_se(d, c("v" %:=% "AUC + R2", "x" %:=% "pmax(AUC,v)"))
  cat(format(optree))
  res <- materialize(my_db, optree, "example", precheck = TRUE)
  cat(format(res))
  sql <- to_sql(res, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))

  # extra example, table that doesn't match declared structure
  rq_copy_to(my_db, 'd',
              data.frame(z = 1:5),
              temporary = TRUE, overwrite = TRUE)
  tryCatch(
     materialize(my_db, optree, "example", precheck = TRUE),
     error = function(e) { as.character(e) }) %.>%
     print(.)

  DBI::dbDisconnect(my_db)
}




