library(DBI)


### Name: dbClearResult
### Title: Clear a result set
### Aliases: dbClearResult

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

rs <- dbSendQuery(con, "SELECT 1")
print(dbFetch(rs))

dbClearResult(rs)
dbDisconnect(con)



