library(rquery)


### Name: rq_connection_name
### Title: Build a canonical name for a db connection class.
### Aliases: rq_connection_name

### ** Examples


if(requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  print(rq_connection_name(my_db))
  DBI::dbDisconnect(my_db)
}




