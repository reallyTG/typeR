library(RPostgreSQL)


### Name: dbGetInfo-methods
### Title: Database interface meta-data
### Aliases: dbGetInfo dbGetDBIVersion-methods dbGetStatement-methods
###   dbGetRowCount-methods dbGetRowsAffected-methods dbColumnInfo-methods
###   dbHasCompleted-methods dbGetInfo,PostgreSQLObject-method
###   dbGetInfo,PostgreSQLDriver-method
###   dbGetInfo,PostgreSQLConnection-method
###   dbGetInfo,PostgreSQLResult-method
###   dbGetStatement,PostgreSQLResult-method
###   dbGetRowCount,PostgreSQLResult-method
###   dbGetRowsAffected,PostgreSQLResult-method
###   dbColumnInfo,PostgreSQLResult-method
###   dbHasCompleted,PostgreSQLResult-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D con <- dbConnect(drv, user= "user", password="password", dbname="sample")
##D 
##D dbListTables(con)
##D 
##D rs <- dbSendQuery(con, query.sql)
##D dbGetStatement(rs)
##D dbHasCompleted(rs)
##D 
##D info <- dbGetInfo(rs)
##D names(dbGetInfo(drv))
##D 
##D # DBIConnection info
##D names(dbGetInfo(con))
##D 
##D # DBIResult info
##D names(dbGetInfo(rs)) 
## End(Not run)



