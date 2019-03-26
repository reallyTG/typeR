library(googledrive)


### Name: drive_rename
### Title: Rename a Drive file
### Aliases: drive_rename

### ** Examples

## Not run: 
##D ## Create a folder to rename
##D folder <- drive_mkdir("folder-to-rename")
##D 
##D ## Rename folder
##D folder <- folder %>%
##D   drive_rename(name = "renamed-folder")
##D 
##D ## Clean up
##D drive_rm(folder)
## End(Not run)



