library(RMariaDB)


### Name: result-meta
### Title: Database interface meta-data.
### Aliases: result-meta dbColumnInfo,MariaDBResult-method
###   dbGetRowsAffected,MariaDBResult-method
###   dbGetRowCount,MariaDBResult-method
###   dbHasCompleted,MariaDBResult-method

### ** Examples

if (mariadbHasDefault()) {
con <- dbConnect(RMariaDB::MariaDB(), dbname = "test")
dbWriteTable(con, "t1", datasets::USArrests, temporary = TRUE)

rs <- dbSendQuery(con, "SELECT * FROM t1 WHERE UrbanPop >= 80")
rs

dbGetStatement(rs)
dbHasCompleted(rs)
dbColumnInfo(rs)

dbFetch(rs)
rs

dbClearResult(rs)
dbDisconnect(con)
}



