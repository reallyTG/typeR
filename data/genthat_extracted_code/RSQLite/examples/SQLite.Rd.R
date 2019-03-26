library(RSQLite)


### Name: SQLite
### Title: Connect to an SQLite database
### Aliases: SQLite RSQLite RSQLite-package dbConnect,SQLiteDriver-method
###   SQLITE_RWC SQLITE_RW SQLITE_RO dbConnect,SQLiteConnection-method
###   dbDisconnect,SQLiteConnection-method

### ** Examples

library(DBI)
# Initialize a temporary in memory database and copy a data.frame into it
con <- dbConnect(RSQLite::SQLite(), ":memory:")
data(USArrests)
dbWriteTable(con, "USArrests", USArrests)
dbListTables(con)

# Fetch all query results into a data frame:
dbGetQuery(con, "SELECT * FROM USArrests")

# Or do it in batches
rs <- dbSendQuery(con, "SELECT * FROM USArrests")
d1 <- dbFetch(rs, n = 10)      # extract data in chunks of 10 rows
dbHasCompleted(rs)
d2 <- dbFetch(rs, n = -1)      # extract all remaining data
dbHasCompleted(rs)
dbClearResult(rs)

# clean up
dbDisconnect(con)



