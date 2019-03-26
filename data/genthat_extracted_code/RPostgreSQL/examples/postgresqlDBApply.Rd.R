library(RPostgreSQL)


### Name: postgresqlDBApply
### Title: Apply R/S-Plus functions to remote groups of DBMS rows
###   (experimental)
### Aliases: postgresqlDBApply
### Keywords: programming interface database

### ** Examples
## Not run: 
##D drv <- dbDriver(RPostgreSQL)
##D con <- dbConnect(drv, user ="usrname", password="pword", dname="database")
##D res <- dbSendQuery(con, 
##D              "select Agent, ip_addr, DATA from pseudo_data order by Agent")
##D out <- dbApply(res, INDEX = "Agent", 
##D         FUN = function(x, grp) quantile(x$DATA, names=FALSE))
## End(Not run)



