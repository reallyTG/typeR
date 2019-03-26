library(replyr)


### Name: replyr_bind_rows
### Title: Bind a list of items by rows (can't use dplyr::bind_rows or
###   dplyr::combine on remote sources).  Columns are intersected.
### Aliases: replyr_bind_rows

### ** Examples


if (requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  # my_db <- sparklyr::spark_connect(master = "local")
  d <- replyr_copy_to(my_db, data.frame(x = 1:2), 'd',
                      temporary = TRUE)
  # dplyr::bind_rows(list(d, d))
  # # Argument 1 must be a data frame or a named atomic vector,
  # # not a tbl_dbi/tbl_sql/tbl_lazy/tbl
  print(replyr_bind_rows(list(d, d)))
  DBI::dbDisconnect(my_db)
}




