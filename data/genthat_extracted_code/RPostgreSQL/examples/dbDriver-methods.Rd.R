library(RPostgreSQL)


### Name: dbDriver-methods
### Title: PostgreSQL implementation of the Database Interface (DBI)
###   classes and drivers
### Aliases: dbDriver-methods dbUnloadDriver-methods
###   dbDriver,character-method dbUnloadDriver,PostgreSQLDriver-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D 
##D # create an PostgreSQL instance and set 10000 of rows per fetch.
##D library(RPostgreSQL)
##D drv <- dbDriver("PostgreSQL", fetch.default.records=10000)
##D 
##D # Connecting to PostgreSQL with the specified parameters
##D con <- dbConnect(drv,user="usrname",password="passwd",dbname="postgres")
##D 
##D # Running the query to obtain the resultset
##D rs <- dbSendQuery(con, "select * from cities where population > 5000")
##D 
##D # fetch records into a dataframe.
##D # n = 50 fetched fifty records
##D df <- fetch(rs, n = 50)
##D # n = -1 fetches all the remaining records available
##D df2 <- fetch(rs, n = -1)
##D 
##D # Clearing the result set
##D dbClearResult(rs)
##D 
##D #This returns a character vector (possibly of zero-length)
##D # table names available on the con connection.
##D dbListTables(con)
## End(Not run)



