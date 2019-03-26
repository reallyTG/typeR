library(AzureStor)


### Name: storage_container
### Title: Storage client generics
### Aliases: storage_container storage_generics
###   storage_container.blob_endpoint storage_container.file_endpoint
###   storage_container.adls_endpoint storage_container.character
###   create_storage_container create_storage_container.blob_endpoint
###   create_storage_container.file_endpoint
###   create_storage_container.adls_endpoint
###   create_storage_container.storage_container
###   create_storage_container.character delete_storage_container
###   delete_storage_container.blob_endpoint
###   delete_storage_container.file_endpoint
###   delete_storage_container.adls_endpoint
###   delete_storage_container.storage_container
###   delete_storage_container.character list_storage_containers
###   list_storage_containers.blob_endpoint
###   list_storage_containers.file_endpoint
###   list_storage_containers.adls_endpoint
###   list_storage_containers.character list_storage_files
###   list_storage_files.blob_container list_storage_files.file_share
###   list_storage_files.adls_filesystem create_storage_dir
###   create_storage_dir.blob_container create_storage_dir.file_share
###   create_storage_dir.adls_filesystem delete_storage_dir
###   delete_storage_dir.blob_container delete_storage_dir.file_share
###   delete_storage_dir.adls_filesystem delete_storage_file
###   delete_storage_file.blob_container delete_storage_file.file_share
###   delete_storage_file.adls_filesystem

### ** Examples

## Not run: 
##D 
##D # storage endpoints for the one account
##D bl <- storage_endpoint("https://mystorage.blob.core.windows.net/", key="access_key")
##D fl <- storage_endpoint("https://mystorage.file.core.windows.net/", key="access_key")
##D 
##D list_storage_containers(bl)
##D list_storage_containers(fl)
##D 
##D # creating containers
##D cont <- create_storage_container(bl, "newblobcontainer")
##D fs <- create_storage_container(fl, "newfileshare")
##D 
##D # creating directories (if possible)
##D create_storage_dir(cont, "newdir")  # will error out
##D create_storage_dir(fs, "newdir")
##D 
##D # transfer a file
##D storage_upload(bl, "~/file.txt", "storage_file.txt")
##D storage_upload(cont, "~/file.txt", "newdir/storage_file.txt")
##D 
## End(Not run)



