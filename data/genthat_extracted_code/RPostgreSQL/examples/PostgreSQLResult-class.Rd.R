library(RPostgreSQL)


### Name: PostgreSQLResult-class
### Title: Class PostgreSQLResult
### Aliases: PostgreSQLResult-class
### Keywords: database interface classes

### ** Examples
## Not run: 
##D drv <- dbDriver("PostgreSQL")
##D con <- dbConnect(drv, dbname = "template1")
##D ## rs is the result set
##D rs <- dbSendQuery(con,"select * from sales")
##D ## display the first three values of result set
##D fetch(rs,n=3)
## End(Not run)



