library(DBI)


### Name: dbExecute
### Title: Execute an update statement, query number of rows affected, and
###   then close result set
### Aliases: dbExecute

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "cars", head(cars, 3))
dbReadTable(con, "cars")   # there are 3 rows
dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (1, 1), (2, 2), (3, 3)"
)
dbReadTable(con, "cars")   # there are now 6 rows

# Pass values using the param argument:
dbExecute(
  con,
  "INSERT INTO cars (speed, dist) VALUES (?, ?)",
  param = list(4:7, 5:8)
)
dbReadTable(con, "cars")   # there are now 10 rows

dbDisconnect(con)



