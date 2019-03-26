library(rdrop2)


### Name: drop_dir
### Title: List folder contents and associated metadata.
### Aliases: drop_dir

### ** Examples

## Not run: 
##D 
##D   # list files in root directory
##D   drop_dir()
##D 
##D   # get a cursor from root directory,
##D   # upload a new file,
##D   # return only information about new file
##D   cursor <- drop_dir(cursor = TRUE)
##D   drop_upload("some_new_file")
##D   drop_dir(cursor = cursor)
## End(Not run)




