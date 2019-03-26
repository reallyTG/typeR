library(salesforcer)


### Name: sf_query
### Title: Perform SOQL Query
### Aliases: sf_query

### ** Examples

## Not run: 
##D sf_query("SELECT Id, Account.Name, Email FROM Contact LIMIT 10")
##D sf_query("SELECT Id, Email FROM Contact LIMIT 10", verbose = TRUE)
## End(Not run)



