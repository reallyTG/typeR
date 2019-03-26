library(RMySQL)


### Name: dbApply
### Title: Apply R/S-Plus functions to remote groups of DBMS rows
###   (experimental)
### Aliases: dbApply dbApply,MySQLResult-method

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test")

dbWriteTable(con, "mtcars", mtcars, overwrite = TRUE)
res <- dbSendQuery(con, "SELECT * FROM mtcars ORDER BY cyl")
dbApply(res, "cyl", function(x, grp) quantile(x$mpg, names=FALSE))

dbClearResult(res)
dbRemoveTable(con, "mtcars")
dbDisconnect(con)
}



