library(rquery)


### Name: set_indicator
### Title: Make a set indicator node.
### Aliases: set_indicator

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(),
                          ":memory:")

  d <- rq_copy_to(my_db, 'd',
                   data.frame(a = c("1", "2", "1", "3"),
                              b = c("1", "1", "3", "2"),
                              q = 1,
                              stringsAsFactors = FALSE),
                   temporary = TRUE,
                   overwrite = TRUE)
  # example
  set <- c("1", "2")
  op_tree <- d %.>%
    set_indicator(., "one_two", "a", set) %.>%
    set_indicator(., "z", "a", c())
  print(column_names(op_tree))
  print(columns_used(op_tree))
  cat(format(op_tree))
  sql <- to_sql(op_tree, my_db)
  cat(sql)
  print(DBI::dbGetQuery(my_db, sql))

  op_tree2 <- d %.>%
    set_indicator(., "one_two", "a", set) %.>%
    set_indicator(., "z", "b", c()) %.>%
    select_columns(., c("z", "one_two"))
  print(column_names(op_tree2))
  print(columns_used(op_tree2))

  # cleanup
  DBI::dbDisconnect(my_db)
}




