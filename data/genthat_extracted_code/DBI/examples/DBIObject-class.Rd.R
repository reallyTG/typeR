library(DBI)


### Name: DBIObject-class
### Title: DBIObject class
### Aliases: DBIObject-class

### ** Examples

drv <- RSQLite::SQLite()
con <- dbConnect(drv)

rs <- dbSendQuery(con, "SELECT 1")
is(drv, "DBIObject")   ## True
is(con, "DBIObject")   ## True
is(rs, "DBIObject")

dbClearResult(rs)
dbDisconnect(con)



