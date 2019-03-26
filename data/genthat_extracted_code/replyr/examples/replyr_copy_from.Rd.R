library(replyr)


### Name: replyr_copy_from
### Title: Bring remote data back as a local data frame tbl.
### Aliases: replyr_copy_from

### ** Examples



if (requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  d <- replyr_copy_to(my_db,data.frame(x=c(1,2)),'d')
  d2 <- replyr_copy_from(d)
  print(d2)
  DBI::dbDisconnect(my_db)
}




