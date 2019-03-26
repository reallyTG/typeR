library(salesforcer)


### Name: sf_retrieve_metadata_check_status
### Title: Check on Retrieve Calls and Get Contents If Available
### Aliases: sf_retrieve_metadata_check_status
### Keywords: internal

### ** Examples

## Not run: 
##D retrieve_request <- list(unpackaged=list(types=list(members='*', name='CustomObject')))
##D retrieve_info <- sf_retrieve_metadata(retrieve_request)
##D 
##D # check on status, this will automatically download the contents to package.zip when ready
##D retrieve_status <- sf_retrieve_metadata_check_status(retrieve_info$id)
## End(Not run)



