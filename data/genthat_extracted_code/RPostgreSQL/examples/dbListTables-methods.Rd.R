library(RPostgreSQL)


### Name: dbListTables-methods
### Title: List items from an PostgreSQL DBMS and from objects
### Aliases: dbListTables-methods dbListFields-methods
###   dbListConnections-methods dbListResults-methods
###   dbListTables,PostgreSQLConnection-method
###   dbListFields,PostgreSQLConnection,character-method
###   dbListFields,PostgreSQLResult,missing-method
###   dbListConnections,PostgreSQLDriver-method
###   dbListResults,PostgreSQLConnection-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D # after working awhile...
##D for(con in dbListConnections(drv)){
##D    dbGetStatement(dbListResults(con))
##D }
## End(Not run)



