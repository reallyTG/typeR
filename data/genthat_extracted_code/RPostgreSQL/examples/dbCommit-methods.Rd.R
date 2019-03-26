library(RPostgreSQL)


### Name: dbCommit-methods
### Title: DBMS Transaction Management
### Aliases: dbBegin-method dbCommit-method dbRollback-method
###   PostgreSQLConnection-method dbBegin,PostgreSQLConnection-method
###   dbCommit,PostgreSQLConnection-method
###   dbRollback,PostgreSQLConnection-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D con <- dbConnect(drv, dbname="postgres")
##D dbGetQuery(con, "select count(*) from sales")
##D 
##D dbBegin(con)
##D rs <- dbSendQuery(con, 
##D       "Delete * from sales as p where p.cost>10")
##D if(dbGetInfo(rs, what = "rowsAffected") > 250){
##D   warning("Rolling back transaction")
##D   dbRollback(con)
##D }else{
##D   dbCommit(con)
##D }
##D 
##D dbGetQuery(con, "select count(*) from sales")
##D dbDisconnect(con)
## End(Not run)



