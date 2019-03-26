library(rquery)


### Name: rsummary_node
### Title: Create an rsumary relop operator node.
### Aliases: rsummary_node

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  d <- data.frame(p= c(TRUE, FALSE, NA),
                  s= NA,
                  w= 1:3,
                  x= c(NA,2,3),
                  y= factor(c(3,5,NA)),
                  z= c('a',NA,'a'),
                  stringsAsFactors=FALSE)
  db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(db)
  rq_copy_to(db, "dRemote", d,
              overwrite = TRUE,
              temporary = TRUE)

  ops <- db_td(db, "dRemote") %.>%
    extend(., v %:=% ifelse(x>2, "x", "y")) %.>%
    rsummary_node(.)
  cat(format(ops))

  print(to_sql(ops, db))

  reshdl <- materialize(db, ops)
  print(DBI::dbGetQuery(db, to_sql(reshdl, db)))

  DBI::dbDisconnect(db)
}




