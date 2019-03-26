library(rquery)


### Name: expand_grid
### Title: Cross product vectors in database.
### Aliases: expand_grid

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
    requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  values <- list(nums = 1:3, lets = c("a", "b"))
  res <- expand_grid(my_db, values)
  print(res)
  execute(my_db, res)
  DBI::dbDisconnect(my_db)
}




