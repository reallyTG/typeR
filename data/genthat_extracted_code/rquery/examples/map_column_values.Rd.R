library(rquery)


### Name: map_column_values
### Title: Remap values in a set of columns.
### Aliases: map_column_values

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(),
                          ":memory:")

  d <- rq_copy_to(my_db, 'd',
                   data.frame(a = c("1", "2", "1", "3"),
                              b = c("1", "1", "3", "2"),
                              c = c("1", "2", "3", "4"),
                              stringsAsFactors = FALSE),
                   temporary = TRUE,
                   overwrite = TRUE)
  mp <- build_frame(
      "column_name", "old_value", "new_value" |
      "a"          , "1"        , "10"        |
      "a"          , "2"        , "20"        |
      "b"          , "1"        , "100"       |
      "b"          , "3"        , "300"       )

  # example
  op_tree <- d %.>%
    map_column_values(., mp)
  cat(format(op_tree))
  sql <- to_sql(op_tree, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))

  # cleanup
  DBI::dbDisconnect(my_db)
}




