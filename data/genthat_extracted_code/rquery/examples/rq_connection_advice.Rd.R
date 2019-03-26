library(rquery)


### Name: rq_connection_advice
### Title: Get advice for a DB connection (beyond tests).
### Aliases: rq_connection_advice

### ** Examples


if(requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  print(rq_connection_name(my_db))
  print(rq_connection_advice(my_db))
  DBI::dbDisconnect(my_db)
}




