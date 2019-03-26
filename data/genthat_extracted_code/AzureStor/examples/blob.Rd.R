library(AzureStor)


### Name: list_blobs
### Title: Operations on a blob container
### Aliases: list_blobs upload_blob download_blob delete_blob

### ** Examples

## Not run: 
##D 
##D cont <- blob_container("https://mystorage.blob.core.windows.net/mycontainer", key="access_key")
##D 
##D list_blobs(cont)
##D 
##D upload_blob(cont, "~/bigfile.zip", dest="bigfile.zip")
##D download_blob(cont, "bigfile.zip", dest="~/bigfile_downloaded.zip")
##D 
##D delete_blob(cont, "bigfile.zip")
##D 
## End(Not run)



