library(pool)


### Name: DBI-object
### Title: DBIObject methods.
### Aliases: DBI-object dbDataType,Pool-method dbGetInfo,Pool-method
###   dbIsValid,Pool-method

### ** Examples

if (requireNamespace("RSQLite", quietly = TRUE)) {
  pool <- dbPool(RSQLite::SQLite(), dbname = ":memory:")

  dbGetInfo(pool)
  dbIsValid(pool)

  dbDataType(pool, 1:5)
  dbDataType(pool, 1)
  dbDataType(pool, TRUE)
  dbDataType(pool, Sys.Date())
  dbDataType(pool, Sys.time())
  dbDataType(pool, Sys.time() - as.POSIXct(Sys.Date()))
  dbDataType(pool, c("x", "abc"))
  dbDataType(pool, list(raw(10), raw(20)))
  dbDataType(pool, I(3))
  dbDataType(pool, iris)

  poolClose(pool)

  dbIsValid(pool)

} else {
  message("Please install the 'RSQLite' package to run this example")
}



