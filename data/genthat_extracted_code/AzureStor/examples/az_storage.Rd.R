library(AzureStor)


### Name: az_storage
### Title: Storage account resource class
### Aliases: az_storage
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way of retrieving a resource: via a resource group object
##D stor <- resgroup$get_storage_account("mystorage")
##D 
##D # list account access keys
##D stor$list_keys()
##D 
##D # regenerate a key
##D stor$regen_key(1)
##D 
##D # generate a shared access signature for blob storage, expiring in 7 days time
##D today <- Sys.time()
##D stor$get_account_sas(expiry=today + 7*24*60*60, services="b", permissions="rw")
##D 
##D # storage endpoints
##D stor$get_blob_endpoint()
##D stor$get_file_endpoint()
##D 
## End(Not run)



