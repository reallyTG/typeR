library(RSQLite)


### Name: sqliteCopyDatabase
### Title: Copy a SQLite database
### Aliases: sqliteCopyDatabase

### ** Examples

library(DBI)
# Copy the built in databaseDb() to an in-memory database
con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbListTables(con)

db <- RSQLite::datasetsDb()
RSQLite::sqliteCopyDatabase(db, con)
dbDisconnect(db)
dbListTables(con)

dbDisconnect(con)



