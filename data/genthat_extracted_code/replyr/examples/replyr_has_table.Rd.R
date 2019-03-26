library(replyr)


### Name: replyr_has_table
### Title: check for a table
### Aliases: replyr_has_table

### ** Examples


if (requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  d <- replyr_copy_to(my_db, data.frame(x=c(1,2)), 'd')
  print(d)
  print(replyr_has_table(my_db, 'd'))
  DBI::dbDisconnect(my_db)
}




