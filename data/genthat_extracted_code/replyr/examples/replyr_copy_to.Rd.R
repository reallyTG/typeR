library(replyr)


### Name: replyr_copy_to
### Title: Copy data to remote service.
### Aliases: replyr_copy_to

### ** Examples



if (requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  d <- replyr_copy_to(my_db, data.frame(x=c(1,2)), 'd')
  print(d)
  DBI::dbDisconnect(my_db)
}




