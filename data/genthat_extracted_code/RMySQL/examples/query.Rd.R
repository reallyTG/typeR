library(RMySQL)


### Name: dbFetch,MySQLResult,numeric-method
### Title: Execute a SQL statement on a database connection.
### Aliases: dbClearResult,MySQLResult-method
###   dbFetch,MySQLResult,missing-method dbFetch,MySQLResult,numeric-method
###   dbGetInfo,MySQLResult-method dbGetStatement,MySQLResult-method
###   dbListFields,MySQLResult,missing-method
###   dbSendQuery,MySQLConnection,character-method
###   fetch,MySQLResult,missing-method fetch,MySQLResult,numeric-method

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test")
dbWriteTable(con, "arrests", datasets::USArrests, overwrite = TRUE)

# Run query to get results as dataframe
dbGetQuery(con, "SELECT * FROM arrests limit 3")

# Send query to pull requests in batches
res <- dbSendQuery(con, "SELECT * FROM arrests")
data <- dbFetch(res, n = 2)
data
dbHasCompleted(res)

dbListResults(con)
dbClearResult(res)
dbRemoveTable(con, "arrests")
dbDisconnect(con)
}



