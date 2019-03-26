library(rquery)


### Name: rq_connection_tests
### Title: Try and test database for some option settings.
### Aliases: rq_connection_tests

### ** Examples


if(requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  print(rq_connection_name(my_db))
  print(rq_connection_tests(my_db,
     overrides = c("use_DBI_dbExistsTable" = FALSE)))
  # the following would set options
  # print(options(rq_connection_tests(my_db)))
  DBI::dbDisconnect(my_db)
}




