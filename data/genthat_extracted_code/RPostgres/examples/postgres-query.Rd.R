library(RPostgres)


### Name: postgres-query
### Title: Execute a SQL statement on a database connection
### Aliases: postgres-query dbSendQuery,PqConnection,character-method
###   dbFetch,PqResult-method dbBind,PqResult-method
###   dbHasCompleted,PqResult-method dbClearResult,PqResult-method

### ** Examples

# For running the examples on systems without PostgreSQL connection:
run <- postgresHasDefault()

library(DBI)
if (run) db <- dbConnect(RPostgres::Postgres())
if (run) dbWriteTable(db, "usarrests", datasets::USArrests, temporary = TRUE)

# Run query to get results as dataframe
if (run) dbGetQuery(db, "SELECT * FROM usarrests LIMIT 3")

# Send query to pull requests in batches
if (run) res <- dbSendQuery(db, "SELECT * FROM usarrests")
if (run) dbFetch(res, n = 2)
if (run) dbFetch(res, n = 2)
if (run) dbHasCompleted(res)
if (run) dbClearResult(res)

if (run) dbRemoveTable(db, "usarrests")

if (run) dbDisconnect(db)



