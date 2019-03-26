library(RPostgreSQL)


### Name: dbSendQuery-methods
### Title: Execute a statement on a given database connection
### Aliases: dbSendQuery-methods dbGetQuery-methods dbClearResult-methods
###   dbGetException-methods
###   dbSendQuery,PostgreSQLConnection,character-method
###   dbGetQuery,PostgreSQLConnection,character-method
###   dbClearResult,PostgreSQLResult-method
###   dbGetException,PostgreSQLConnection-method
###   dbGetException,PostgreSQLResult-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D con <- dbConnect(drv, "usr", "password", "dbname")
##D res <- dbSendQuery(con, "SELECT * from sales")
##D data <- fetch(res, n = -1)
##D # alternatively, use dbGetQuery
##D data <- dbGetQuery(con, "SELECT * from sales")
## End(Not run)



