library(googledrive)


### Name: drive_trash
### Title: Move Drive files to or from trash
### Aliases: drive_trash drive_untrash

### ** Examples

## Not run: 
##D ## Create a file and put it in the trash.
##D file <- drive_upload(drive_example("chicken.txt"), "chicken-trash.txt")
##D drive_trash("chicken-trash.txt")
##D 
##D ## Confirm it's in the trash
##D drive_find(trashed = TRUE)
##D 
##D ## Remove it from the trash and confirm
##D drive_untrash("chicken-trash.txt")
##D drive_find(trashed = TRUE)
##D 
##D ## Clean up
##D drive_rm("chicken-trash.txt")
## End(Not run)



