library(rquery)


### Name: assign_slice
### Title: Assign a value to a slice of data (set of rows meeting a
###   condition, and specified set of columns).
### Aliases: assign_slice

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  d <- rq_copy_to(
    my_db,
    'd',
    data.frame(i = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
               a = c(0, 0, 1, 1, 1, 1, 1, 1, 1, 1),
               b = c(0, 1, 0, 1, 1, 1, 1, 1, 1, 1),
               r = runif(10)),
    temporary=TRUE, overwrite=TRUE)

  optree <- d %.>%
    assign_slice(.,
                 testexpr = qe(r<0.5),
                 columns = qc(a, b),
                 value = 2)
  cat(format(optree))

  sql <- to_sql(optree, my_db)
  cat(sql)

  print(DBI::dbGetQuery(my_db, sql))

  DBI::dbDisconnect(my_db)
}




