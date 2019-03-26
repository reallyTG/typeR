library(RPostgreSQL)


### Name: dbConnect-methods
### Title: Create a connection object to an PostgreSQL DBMS
### Aliases: dbDisconnect-methods dbConnect-methods
###   dbDisconnect,PostgreSQLConnection-method
###   dbConnect,PostgreSQLDriver-method
###   dbConnect,PostgreSQLConnection-method dbConnect,character-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D # create an PostgreSQL instance and create one connection.
##D drv <- dbDriver("PostgreSQL")
##D 
##D # open the connection using user, passsword, etc., as
##D con <- dbConnect(drv, dbname = "postgres")
##D 
##D df <- dbGetQuery(con, statement = paste(
##D                       "SELECT itemCode, itemCost, itemProfit",
##D                       "FROM sales",
##D                       "SORT BY itemName"));
##D # Run an SQL statement by creating first a resultSet object
##D rs <- dbSendQuery(con, statement = paste(
##D                       "SELECT itemCode, itemCost, itemProfit",
##D                       "FROM sales",
##D                       "SORT BY itemName"));
##D 
##D # we now fetch records from the resultSet into a data.frame
##D df <- fetch(rs, n = -1)   # extract all rows
##D dim(df)
## End(Not run)



