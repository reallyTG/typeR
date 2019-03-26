library(RForcecom)


### Name: rforcecom.upsert
### Title: Upsert a record
### Aliases: rforcecom.upsert
### Keywords: connection

### ** Examples

## Not run: 
##D  # Upsert a record
##D  objectName <- "Account";
##D  externalIdField <- "AccountMaster__c"
##D  externalId <- "AM-00000151"
##D  fields <- c(Name="ABC Network Company", Phone="3333-3333-3333")
##D  rforcecom.upsert(session, objectName, externalIdField, externalId, fields)
##D  
## End(Not run)



