library(rdrop2)


### Name: drop_download
### Title: Download a file from Dropbox to disk.
### Aliases: drop_download

### ** Examples

## Not run: 
##D 
##D   # download a file to the current working directory
##D   drop_get("dataset.zip")
##D 
##D   # download again, overwriting previous result
##D   drop_get("dataset.zip", overwrite = TRUE)
##D 
##D   # download to a different path, keeping file name constant
##D   # will download to "some/other/place/dataset.zip"
##D   drop_get("dataset.zip", local_path = "some/other/place/")
##D 
##D   # download to to a different path, changing filename
##D   drop_get("dataset.zip", local_path = "some/other/place/not_a_dataset.zip")
## End(Not run)




