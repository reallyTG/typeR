library(RPostgreSQL)


### Name: dbApply-methods
### Title: Apply R/S-Plus functions to remote groups of DBMS rows
###   (experimental)
### Aliases: dbApply-methods dbApply,PostgreSQLResult-method
### Keywords: programming interface database

### ** Examples
## Not run: 
##D ## compute quanitiles for each network agent
##D con <- dbConnect(PostgreSQL(), user="user", password="passwd",dbname="dbname")
##D rs <- dbSendQuery(con, 
##D              "select Agent, ip_addr, DATA from pseudo_data order by Agent")
##D out <- dbApply(rs, INDEX = "Agent", 
##D         FUN = function(x, grp) quantile(x$DATA, names=FALSE))
## End(Not run)



