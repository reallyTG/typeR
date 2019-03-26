library(DBI)


### Name: dbListTables
### Title: List remote tables
### Aliases: dbListTables

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbListTables(con)
dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)

dbDisconnect(con)



