library(googledrive)


### Name: drive_publish
### Title: Publish native Google files
### Aliases: drive_publish drive_unpublish

### ** Examples

## Not run: 
##D ## Upload file to publish
##D file <- drive_upload(
##D   drive_example("chicken.csv"),
##D   type = "spreadsheet"
##D   )
##D 
##D ## Publish file
##D file <- drive_publish(file)
##D file$published
##D 
##D ## Unpublish file
##D file <- drive_unpublish(file)
##D file$published
##D 
##D ## Clean up
##D drive_rm(file)
## End(Not run)



