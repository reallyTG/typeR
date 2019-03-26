library(pool)


### Name: poolWithTransaction
### Title: Self-contained database transactions using pool
### Aliases: poolWithTransaction dbBreak

### ** Examples

if (requireNamespace("RSQLite", quietly = TRUE)) {
  pool <- dbPool(RSQLite::SQLite(), dbname = ":memory:")

  dbWriteTable(pool, "cars", head(cars, 3))
  dbReadTable(pool, "cars")   # there are 3 rows

  ## successful transaction
  poolWithTransaction(pool, function(conn) {
    dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
    dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (2, 2);")
    dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
  })
  dbReadTable(pool, "cars")   # there are now 6 rows

  ## failed transaction -- note the missing comma
  tryCatch(
    poolWithTransaction(pool, function(conn) {
      dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
      dbExecute(conn, "INSERT INTO cars (speed dist) VALUES (2, 2);")
      dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
    }),
    error = identity
  )
  dbReadTable(pool, "cars")   # still 6 rows

  ## early exit, silently
  poolWithTransaction(pool, function(conn) {
    dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (1, 1);")
    dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (2, 2);")
    if (nrow(dbReadTable(conn, "cars")) > 7) dbBreak()
    dbExecute(conn, "INSERT INTO cars (speed, dist) VALUES (3, 3);")
  })
  dbReadTable(pool, "cars")   # still 6 rows

  poolClose(pool)

} else {
  message("Please install the 'RSQLite' package to run this example")
}



