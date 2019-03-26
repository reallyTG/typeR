library(replyr)


### Name: replyr_list_tables
### Title: list tables
### Aliases: replyr_list_tables

### ** Examples


if (requireNamespace("RSQLite", quietly = TRUE)) {
   my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
   RSQLite::initExtension(my_db)
  d <- replyr_copy_to(my_db, data.frame(x=c(1,2)), 'd',
                      overwrite=TRUE, temporary=TRUE)
  print(d)
  print(replyr_list_tables(my_db))
  DBI::dbDisconnect(my_db)
}




