library(RMySQL)


### Name: dbNextResult
### Title: Fetch next result set from an SQL script or stored procedure
###   (experimental)
### Aliases: dbMoreResults dbMoreResults,MySQLConnection-method
###   dbNextResult dbNextResult,MySQLConnection-method

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test", client.flag = CLIENT_MULTI_STATEMENTS)
dbWriteTable(con, "mtcars", datasets::mtcars, overwrite = TRUE)

sql <- "SELECT cyl FROM mtcars LIMIT 5; SELECT vs FROM mtcars LIMIT 5"
rs1 <- dbSendQuery(con, sql)
dbFetch(rs1, n = -1)

if (dbMoreResults(con)) {
   rs2 <- dbNextResult(con)
   dbFetch(rs2, n = -1)
}

dbClearResult(rs1)
dbClearResult(rs2)
dbRemoveTable(con, "mtcars")
dbDisconnect(con)
}



