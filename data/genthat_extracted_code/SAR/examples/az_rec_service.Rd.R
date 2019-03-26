library(SAR)


### Name: az_rec_service
### Title: Azure product recommendations service class
### Aliases: az_rec_service
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way of retrieving a resource: via a resource group object
##D svc <- resgroup$get_rec_service("myrec")
##D 
##D # start the service backend
##D svc$start()
##D 
##D # get the service endpoint
##D rec_endp <- svc$get_rec_endpoint()
##D 
## End(Not run)



