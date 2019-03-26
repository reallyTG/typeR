library(DBI)


### Name: dbRemoveTable
### Title: Remove a table from the database
### Aliases: dbRemoveTable

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbExistsTable(con, "iris")
dbWriteTable(con, "iris", iris)
dbExistsTable(con, "iris")
dbRemoveTable(con, "iris")
dbExistsTable(con, "iris")

dbDisconnect(con)



