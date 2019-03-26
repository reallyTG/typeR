library(rquery)


### Name: lookup_by_column
### Title: Use one column to pick values from other columns.
### Aliases: lookup_by_column

### ** Examples


df = data.frame(x = c(1, 2, 3, 4),
                y = c(5, 6, 7, 8),
                choice = c("x", "y", "x", "z"),
                stringsAsFactors = FALSE)

# library("rqdatatable")
# df %.>%
#   lookup_by_column(., "choice", "derived")

if (requireNamespace("DBI", quietly = TRUE) &&
    requireNamespace("RSQLite", quietly = TRUE)) {
  db <- DBI::dbConnect(RSQLite::SQLite(),
                       ":memory:")
  RSQLite::initExtension(db)
  dr <- rq_copy_to(db, "dRemote", df,
                   overwrite = TRUE,
                   temporary = TRUE)

  ops <- dr %.>%
    lookup_by_column(., "choice", "derived")
  cat(format(ops))

  execute(db, ops) %.>%
     print(.)

  DBI::dbDisconnect(db)
}





