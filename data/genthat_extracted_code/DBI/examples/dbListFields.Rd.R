library(DBI)


### Name: dbListFields
### Title: List field names of a remote table
### Aliases: dbListFields

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbListFields(con, "mtcars")

dbDisconnect(con)



