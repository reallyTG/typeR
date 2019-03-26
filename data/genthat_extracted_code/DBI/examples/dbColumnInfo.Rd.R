library(DBI)


### Name: dbColumnInfo
### Title: Information about result types
### Aliases: dbColumnInfo

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

rs <- dbSendQuery(con, "SELECT 1 AS a, 2 AS b")
dbColumnInfo(rs)
dbFetch(rs)

dbClearResult(rs)
dbDisconnect(con)



