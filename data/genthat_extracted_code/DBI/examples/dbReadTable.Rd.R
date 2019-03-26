library(DBI)


### Name: dbReadTable
### Title: Copy data frames from database tables
### Aliases: dbReadTable

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars[1:10, ])
dbReadTable(con, "mtcars")

dbDisconnect(con)



