library(RMySQL)


### Name: result-meta
### Title: Database interface meta-data.
### Aliases: dbColumnInfo,MySQLResult-method
###   dbGetException,MySQLResult-method dbGetRowCount,MySQLResult-method
###   dbGetRowsAffected,MySQLResult-method
###   dbHasCompleted,MySQLResult-method result-meta show,MySQLResult-method
###   summary,MySQLResult-method

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test")
dbWriteTable(con, "t1", datasets::USArrests, overwrite = TRUE)

rs <- dbSendQuery(con, "SELECT * FROM t1 WHERE UrbanPop >= 80")
dbGetStatement(rs)
dbHasCompleted(rs)

dbGetInfo(rs)
dbColumnInfo(rs)

dbClearResult(rs)
dbRemoveTable(con, "t1")
dbDisconnect(con)
}



