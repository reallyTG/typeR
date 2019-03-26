library(rquery)


### Name: project_se
### Title: project data by grouping, and adding aggregate columns.
### Aliases: project_se aggregate_se

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(),
                          ":memory:")
  d <- rq_copy_to(
    my_db, 'd',
    data.frame(group = c('a', 'a', 'b', 'b'),
               val = 1:4,
               stringsAsFactors = FALSE))

  op_tree <- d %.>%
    project_se(., groupby = "group", "vmax" %:=% "max(val)")
  cat(format(op_tree))
  sql <- to_sql(op_tree, my_db)
  cat(sql)
  execute(my_db, op_tree) %.>%
     print(.)

  op_tree <- d %.>%
    project_se(., groupby = NULL, "vmax" %:=% "max(val)")
  cat(format(op_tree))
  sql <- to_sql(op_tree, my_db)
  cat(sql)
  execute(my_db, op_tree) %.>%
     print(.)

  DBI::dbDisconnect(my_db)
}




