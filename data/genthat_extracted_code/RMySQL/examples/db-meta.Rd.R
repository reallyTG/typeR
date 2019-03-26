library(RMySQL)


### Name: db-meta
### Title: Database interface meta-data
### Aliases: db-meta dbGetException,MySQLConnection-method
###   dbGetInfo,MySQLConnection-method dbListResults,MySQLConnection-method
###   show,MySQLConnection-method summary,MySQLConnection-method

### ** Examples

if (mysqlHasDefault()) {
  con <- dbConnect(RMySQL::MySQL(), dbname = "test")

  summary(con)

  dbGetInfo(con)
  dbListResults(con)
  dbListTables(con)

  dbDisconnect(con)
}



