library(rquery)


### Name: rstr
### Title: Quick look at remote data
### Aliases: rstr rlook

### ** Examples


if ( requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  DBI::dbWriteTable(my_db,
                    'd',
                    data.frame(AUC = 0.6, R2 = 0.2),
                    overwrite = TRUE,
                    temporary = TRUE)
  rlook(my_db, 'd')
  DBI::dbDisconnect(my_db)
}




