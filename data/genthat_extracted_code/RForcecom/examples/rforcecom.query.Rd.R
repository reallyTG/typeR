library(RForcecom)


### Name: rforcecom.query
### Title: Execute a SOQL
### Aliases: rforcecom.query
### Keywords: connection

### ** Examples

## Not run: 
##D  # Execute a SOQL
##D  soqlQuery <- "SELECT Id, Name, Industry, AnnualRevenue FROM Account"
##D  rforcecom.query(session, soqlQuery)
##D  
##D  # Include records where IsDeleted=true
##D  soqlQuery <- "SELECT Id, IsDeleted, Subject, Description FROM Task"
##D  rforcecom.query(session, soqlQuery, queryAll=TRUE)
##D  
## End(Not run)



