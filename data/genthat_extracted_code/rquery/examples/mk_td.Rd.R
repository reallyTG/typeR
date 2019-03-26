library(rquery)


### Name: mk_td
### Title: Make a table description directly.
### Aliases: mk_td table_source

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  rq_copy_to(my_db,
             'd',
             data.frame(AUC = 0.6, R2 = 0.2),
             overwrite = TRUE,
             temporary = TRUE)
  d <- mk_td('d',
                    columns = c("AUC", "R2"))
  print(d)
  sql <- to_sql(d, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))
  DBI::dbDisconnect(my_db)
}




