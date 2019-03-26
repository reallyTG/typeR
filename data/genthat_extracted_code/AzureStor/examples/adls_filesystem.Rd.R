library(AzureStor)


### Name: adls_filesystem
### Title: Operations on an Azure Data Lake Storage Gen2 endpoint
### Aliases: adls_filesystem adls_filesystem.character
###   adls_filesystem.adls_endpoint print.adls_filesystem
###   list_adls_filesystems list_adls_filesystems.character
###   list_adls_filesystems.adls_endpoint create_adls_filesystem
###   create_adls_filesystem.character
###   create_adls_filesystem.adls_filesystem
###   create_adls_filesystem.adls_endpoint delete_adls_filesystem
###   delete_adls_filesystem.character
###   delete_adls_filesystem.adls_filesystem
###   delete_adls_filesystem.adls_endpoint

### ** Examples

## Not run: 
##D 
##D endp <- adls_endpoint("https://mystorage.dfs.core.windows.net/", key="access_key")
##D 
##D # list ADLSgen2 filesystems
##D list_adls_filesystems(endp)
##D 
##D # get, create, and delete a filesystem
##D adls_filesystem(endp, "myfs")
##D create_adls_filesystem(endp, "newfs")
##D delete_adls_filesystem(endp, "newfs")
##D 
##D # alternative way to do the same
##D adls_filesystem("https://mystorage.dfs.core.windows.net/myfs", key="access_key")
##D create_adls_filesystem("https://mystorage.dfs.core.windows.net/newfs", key="access_key")
##D delete_adls_filesystem("https://mystorage.dfs.core.windows.net/newfs", key="access_key")
##D 
## End(Not run)



