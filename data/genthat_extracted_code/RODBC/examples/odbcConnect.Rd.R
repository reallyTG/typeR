library(RODBC)


### Name: odbcConnect
### Title: ODBC Open Connections
### Aliases: odbcConnect odbcDriverConnect odbcReConnect
### Keywords: IO database

### ** Examples
## Not run: 
##D # MySQL
##D channel <- odbcConnect("test", uid="ripley", pwd="secret")
##D # PostgreSQL: 'case' should be detected automatically
##D channel <- odbcConnect("pg", uid="ripley", pwd="secret", case="postgresql")
##D 
##D # re-connection
##D odbcCloseAll()
##D channel <- odbcReConnect(channel) # must re-assign as the data may change
## End(Not run)


