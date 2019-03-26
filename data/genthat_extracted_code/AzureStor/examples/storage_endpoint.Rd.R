library(AzureStor)


### Name: storage_endpoint
### Title: Create a storage endpoint object
### Aliases: storage_endpoint endpoint blob_endpoint file_endpoint
###   queue_endpoint table_endpoint adls_endpoint print.storage_endpoint
###   print.adls_endpoint

### ** Examples

## Not run: 
##D 
##D # obtaining an endpoint from the storage account resource object
##D endp <- stor$get_blob_endpoint()
##D 
##D # creating an endpoint standalone
##D endp <- blob_endpoint("https://mystorage.blob.core.windows.net/", key="access_key")
##D 
## End(Not run)



