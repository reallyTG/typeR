library(AzureStor)


### Name: blob_container
### Title: Operations on a blob endpoint
### Aliases: blob_container blob_container.character
###   blob_container.blob_endpoint print.blob_container
###   list_blob_containers list_blob_containers.character
###   list_blob_containers.blob_endpoint create_blob_container
###   create_blob_container.character create_blob_container.blob_container
###   create_blob_container.blob_endpoint delete_blob_container
###   delete_blob_container.character delete_blob_container.blob_container
###   delete_blob_container.blob_endpoint

### ** Examples

## Not run: 
##D 
##D endp <- blob_endpoint("https://mystorage.blob.core.windows.net/", key="access_key")
##D 
##D # list containers
##D list_blob_containers(endp)
##D 
##D # get, create, and delete a container
##D blob_container(endp, "mycontainer")
##D create_blob_container(endp, "newcontainer")
##D delete_blob_container(endp, "newcontainer")
##D 
##D # alternative way to do the same
##D blob_container("https://mystorage.blob.core.windows.net/mycontainer", key="access_key")
##D create_blob_container("https://mystorage.blob.core.windows.net/newcontainer", key="access_key")
##D delete_blob_container("https://mystorage.blob.core.windows.net/newcontainer", key="access_key")
##D 
## End(Not run)



