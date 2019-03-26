library(rquery)


### Name: rsummary
### Title: Compute usable summary of columns of remote table.
### Aliases: rsummary

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
  requireNamespace("RSQLite", quietly = TRUE)) {
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
              overwrite = TRUE, temporary = TRUE)
  print(rsummary(db, "dRemote"))
  DBI::dbDisconnect(db)
}




