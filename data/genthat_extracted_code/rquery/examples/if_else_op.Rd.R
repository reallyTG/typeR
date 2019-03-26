library(rquery)


### Name: if_else_op
### Title: Build a 'relop' node simulating a per-row block-'if(){}else{}'.
### Aliases: if_else_op

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  # Example: clear one of a or b in any row where both are set.
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  d <- rq_copy_to(
    my_db,
    'd',
    data.frame(i = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
               a = c(0, 0, 1, 1, 1, 1, 1, 1, 1, 1),
               b = c(0, 1, 0, 1, 1, 1, 1, 1, 1, 1),
               edited = NA),
    temporary=TRUE, overwrite=TRUE)

  optree <- d %.>%
    if_else_op(.,
               testexpr = qe((a+b)>1),
               thenexprs = qae(a %:=% 0,
                               b %:=% 0,
                               edited %:=% 1),
               elseexprs = qae(edited %:=% 0))
  cat(format(optree))

  sql <- to_sql(optree, my_db)
  cat(sql)

  print(DBI::dbGetQuery(my_db, sql))

  DBI::dbDisconnect(my_db)
}





