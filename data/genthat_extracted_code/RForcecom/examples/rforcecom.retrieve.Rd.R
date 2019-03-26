library(RForcecom)


### Name: rforcecom.retrieve
### Title: Retrieve a record
### Aliases: rforcecom.retrieve
### Keywords: connection

### ** Examples

## Not run: 
##D  # Retrieving a record
##D  objectName <- "Account"
##D  fields <- c("name", "Industry", "AnnualRevenue")
##D  rforcecom.retrieve(session, objectName, fields)
##D  rforcecom.retrieve(session, objectName, fields, limit = 5)
##D  rforcecom.retrieve(session, objectName, fields, id = "999x000000xxxxxZZZ")
##D  rforcecom.retrieve(session, objectName, fields)
##D  rforcecom.retrieve(session, objectName, fields, order = c("Industry","Name"))
##D  rforcecom.retrieve(session, objectName, fields, order = c("Industry","Name"),
##D                     inverse=TRUE, nullsLast=TRUE)
##D  
## End(Not run)



