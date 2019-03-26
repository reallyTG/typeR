library(DBI)


### Name: dbCreateTable
### Title: Create a table in the database
### Aliases: dbCreateTable

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbCreateTable(con, "iris", iris)
dbReadTable(con, "iris")
dbDisconnect(con)



