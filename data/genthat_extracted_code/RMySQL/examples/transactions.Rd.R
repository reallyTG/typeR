library(RMySQL)


### Name: transactions
### Title: DBMS Transaction Management
### Aliases: dbBegin,MySQLConnection-method dbCommit,MySQLConnection-method
###   dbRollback,MySQLConnection-method transactions

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test")
df <- data.frame(id = 1:5)

dbWriteTable(con, "df", df)
dbBegin(con)
dbGetQuery(con, "UPDATE df SET id = id * 10")
dbGetQuery(con, "SELECT id FROM df")
dbRollback(con)

dbGetQuery(con, "SELECT id FROM df")

dbRemoveTable(con, "df")
dbDisconnect(con)
}



