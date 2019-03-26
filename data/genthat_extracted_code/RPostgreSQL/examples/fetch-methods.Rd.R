library(RPostgreSQL)


### Name: fetch-methods
### Title: Fetch records from a previously executed query
### Aliases: fetch-methods fetch,PostgreSQLResult,numeric-method
###   fetch,PostgreSQLResult,missing-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D con <- dbConnect(drv, user = "ruser",password = "123456",dbname = "status")
##D res <- dbSendQuery(con, statement = paste(
##D                       "SELECT w.category, w.cost, p.type",
##D                       "FROM items w, sales P",
##D                       "WHERE w.category = p.type",
##D                       "ORDER BY w.cost"))
##D # we now fetch the first 100 records from the resultSet into a data.frame
##D data1 <- fetch(res, n = 100)   
##D dim(data1)
##D 
##D dbHasCompleted(res)
##D 
##D # let's get all remaining records
##D data2 <- fetch(res, n = -1)
## End(Not run)



