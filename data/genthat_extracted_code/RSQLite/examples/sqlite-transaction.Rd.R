library(RSQLite)


### Name: sqlite-transaction
### Title: SQLite transaction management
### Aliases: sqlite-transaction dbBegin,SQLiteConnection-method
###   dbCommit,SQLiteConnection-method dbRollback,SQLiteConnection-method

### ** Examples

library(DBI)
con <- dbConnect(SQLite(), ":memory:")
dbWriteTable(con, "arrests", datasets::USArrests)
dbGetQuery(con, "select count(*) from arrests")

dbBegin(con)
rs <- dbSendStatement(con, "DELETE from arrests WHERE Murder > 1")
dbGetRowsAffected(rs)
dbClearResult(rs)

dbGetQuery(con, "select count(*) from arrests")

dbRollback(con)
dbGetQuery(con, "select count(*) from arrests")[1, ]

dbBegin(con)
rs <- dbSendStatement(con, "DELETE FROM arrests WHERE Murder > 5")
dbClearResult(rs)
dbCommit(con)
dbGetQuery(con, "SELECT count(*) FROM arrests")[1, ]

# Named savepoints can be nested --------------------------------------------
dbBegin(con, name = "a")
dbBegin(con, name = "b")
dbRollback(con, name = "b")
dbCommit(con, name = "a")

dbDisconnect(con)



