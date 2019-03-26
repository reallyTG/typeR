library(DBI)


### Name: dbExistsTable
### Title: Does a table exist?
### Aliases: dbExistsTable

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")

dbDisconnect(con)



