library(AzureStor)


### Name: file_share
### Title: Operations on a file endpoint
### Aliases: file_share file_share.character file_share.file_endpoint
###   print.file_share list_file_shares list_file_shares.character
###   list_file_shares.file_endpoint create_file_share
###   create_file_share.character create_file_share.file_share
###   create_file_share.file_endpoint delete_file_share
###   delete_file_share.character delete_file_share.file_share
###   delete_file_share.file_endpoint

### ** Examples

## Not run: 
##D 
##D endp <- file_endpoint("https://mystorage.file.core.windows.net/", key="access_key")
##D 
##D # list file shares
##D list_file_shares(endp)
##D 
##D # get, create, and delete a file share
##D file_share(endp, "myshare")
##D create_file_share(endp, "newshare")
##D delete_file_share(endp, "newshare")
##D 
##D # alternative way to do the same
##D file_share("https://mystorage.file.file.windows.net/myshare", key="access_key")
##D create_file_share("https://mystorage.file.core.windows.net/newshare", key="access_key")
##D delete_file_share("https://mystorage.file.core.windows.net/newshare", key="access_key")
##D 
## End(Not run)



