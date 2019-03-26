library(DBI)


### Name: dbAppendTable
### Title: Insert rows into a table
### Aliases: dbAppendTable

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbCreateTable(con, "iris", iris)
dbAppendTable(con, "iris", iris)
dbReadTable(con, "iris")
dbDisconnect(con)



