library(rquery)


### Name: extend_se
### Title: Extend data by adding more columns.
### Aliases: extend_se

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  d <- rq_copy_to(my_db, 'd',
                   data.frame(AUC = 0.6, R2 = 0.2))
  optree <- extend_se(d, c("v" %:=% "AUC + R2", "x" %:=% "pmax(AUC,v)"))
  cat(format(optree))
  sql <- to_sql(optree, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))

  # SQLite can not run the following query
  optree2 <- extend_se(d, "v" %:=% "rank()",
                    partitionby = "AUC", orderby = "R2")
  sql2 <- to_sql(optree2, my_db)
  cat(sql2)

  DBI::dbDisconnect(my_db)
}




