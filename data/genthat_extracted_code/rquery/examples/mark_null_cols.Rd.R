library(rquery)


### Name: mark_null_cols
### Title: Indicate NULLs per row for given column set.
### Aliases: mark_null_cols

### ** Examples


# WARNING: example tries to change rquery.rquery_db_executor option to RSQLite and back.
if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  old_o <- options(list("rquery.rquery_db_executor" = list(db = my_db)))

  d <- rq_copy_to(my_db, 'd',
                   data.frame(AUC = c(0.6, 0.5, NA),
                              R2 = c(1.0, 0.9, NA)))
  op_tree <- d %.>% mark_null_cols(., qc(AUC_NULL, R2_NULL) %:=%
                                     qc(AUC, R2))
  cat(format(op_tree))
  sql <- to_sql(op_tree, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))

  # ad-hoc mode
  data.frame(AUC=c(1,NA,0.5), R2=c(NA,1,0)) %.>%
     op_tree %.>%
     print(.)

  # cleanup
  options(old_o)
  DBI::dbDisconnect(my_db)
}




