library(AzureStor)


### Name: list_adls_files
### Title: Operations on an Azure Data Lake Storage Gen2 filesystem
### Aliases: list_adls_files upload_adls_file download_adls_file
###   delete_adls_file create_adls_dir delete_adls_dir

### ** Examples

## Not run: 
##D 
##D fs <- adls_filesystem("https://mystorage.dfs.core.windows.net/myfilesystem", key="access_key")
##D 
##D list_adls_files(fs, "/")
##D 
##D create_adls_dir(fs, "/newdir")
##D 
##D upload_adls_file(fs, "~/bigfile.zip", dest="/newdir/bigfile.zip")
##D download_adls_file(fs, "/newdir/bigfile.zip", dest="~/bigfile_downloaded.zip")
##D 
##D delete_adls_file(fs, "/newdir/bigfile.zip")
##D delete_adls_dir(fs, "/newdir")
##D 
## End(Not run)



