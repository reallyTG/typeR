library(DBI)


### Name: dbListObjects
### Title: List remote objects
### Aliases: dbListObjects

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbListObjects(con)
dbWriteTable(con, "mtcars", mtcars)
dbListObjects(con)

dbDisconnect(con)



