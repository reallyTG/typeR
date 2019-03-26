library(AzureStor)


### Name: list_azure_files
### Title: Operations on a file share
### Aliases: list_azure_files upload_azure_file download_azure_file
###   delete_azure_file create_azure_dir delete_azure_dir

### ** Examples

## Not run: 
##D 
##D share <- file_share("https://mystorage.file.core.windows.net/myshare", key="access_key")
##D 
##D list_azure_files(share, "/")
##D 
##D create_azure_dir(share, "/newdir")
##D 
##D upload_azure_file(share, "~/bigfile.zip", dest="/newdir/bigfile.zip")
##D download_azure_file(share, "/newdir/bigfile.zip", dest="~/bigfile_downloaded.zip")
##D 
##D delete_azure_file(share, "/newdir/bigfile.zip")
##D delete_azure_dir(share, "/newdir")
##D 
## End(Not run)



