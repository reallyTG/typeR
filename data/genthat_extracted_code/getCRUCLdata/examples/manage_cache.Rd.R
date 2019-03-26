library(getCRUCLdata)


### Name: manage_cache
### Title: Manage locally cached CRU CL v. 2.0 files
### Aliases: manage_cache

### ** Examples

## Not run: 
##D 
##D # list files in cache
##D manage_cache$list()
##D 
##D # delete certain database files
##D manage_cache$delete("file path")
##D manage_cache$list()
##D 
##D # delete all files in cache
##D manage_cache$delete_all()
##D manage_cache$list()
##D 
##D # set a different cache path from the default
##D manage_cache$cache_path_set("~/tmp")
## End(Not run)



