library(rquery)


### Name: sql_expr_set
### Title: Build a query that applies a SQL expression to a set of columns.
### Aliases: sql_expr_set

### ** Examples


# WARNING: example tries to change rquery.rquery_db_executor option to RSQLite and back.
if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  old_o <- options(list("rquery.rquery_db_executor" = list(db = my_db)))

  d <- rq_copy_to(my_db, 'd',
                   data.frame(AUC = c(NA, 0.5, NA),
                              R2 = c(1.0, 0.9, NA),
                              delta = 3,
                              cat = c("a", NA, "c"),
                              stringsAsFactors = FALSE))

  # example
  op_tree <- d %.>% sql_expr_set(., qc(AUC, R2), ". + 1")
  cat(format(op_tree))
  sql <- to_sql(op_tree, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))

  # ex2 names (but not marked as names)
  op_tree2 <- d %.>% sql_expr_set(., qc(AUC, R2),
     ". + 1 + delta")
  cat(to_sql(op_tree2, my_db))

  # ex3 names (also so marked)
  op_tree3 <- d %.>% sql_expr_set(., qc(AUC, R2),
     list(". + 1 +", as.name("delta")))
  cat(to_sql(op_tree3, my_db))

  # cleanup
  options(old_o)
  DBI::dbDisconnect(my_db)
}




