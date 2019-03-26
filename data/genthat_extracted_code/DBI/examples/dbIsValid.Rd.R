library(DBI)


### Name: dbIsValid
### Title: Is this DBMS object still valid?
### Aliases: dbIsValid

### ** Examples

dbIsValid(RSQLite::SQLite())

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbIsValid(con)

rs <- dbSendQuery(con, "SELECT 1")
dbIsValid(rs)

dbClearResult(rs)
dbIsValid(rs)

dbDisconnect(con)
dbIsValid(con)



