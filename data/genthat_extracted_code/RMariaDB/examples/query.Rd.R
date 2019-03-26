library(RMariaDB)


### Name: dbFetch,MariaDBResult-method
### Title: Execute a SQL statement on a database connection.
### Aliases: dbFetch,MariaDBResult-method
###   dbSendQuery,MariaDBConnection,character-method
###   dbSendStatement,MariaDBConnection,character-method
###   dbBind,MariaDBResult-method dbClearResult,MariaDBResult-method
###   dbGetStatement,MariaDBResult-method

### ** Examples

if (mariadbHasDefault()) {
con <- dbConnect(RMariaDB::MariaDB(), dbname = "test")
dbWriteTable(con, "arrests", datasets::USArrests, temporary = TRUE)

# Run query to get results as dataframe
dbGetQuery(con, "SELECT * FROM arrests limit 3")

# Send query to pull requests in batches
res <- dbSendQuery(con, "SELECT * FROM arrests")
data <- dbFetch(res, n = 2)
data
dbHasCompleted(res)

dbClearResult(res)
dbDisconnect(con)
}



