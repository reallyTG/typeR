library(googledrive)


### Name: drive_update
### Title: Update an existing Drive file
### Aliases: drive_update

### ** Examples

## Not run: 
##D ## Create a new file, so we can update it
##D x <- drive_upload(drive_example("chicken.csv"))
##D 
##D ## Update the file with new media
##D x <- x %>%
##D   drive_update(drive_example("chicken.txt"))
##D 
##D ## Update the file with new metadata.
##D ## Notice here `name` is not an argument of `drive_update()`, we are passing
##D ## this to the API via the `...``
##D x <- x %>%
##D   drive_update(name = "CHICKENS!")
##D 
##D ## We can add a parent folder by passing `addParents` via `...`.
##D folder <- drive_mkdir("second-parent-folder")
##D x <- x %>%
##D   drive_update(addParents = as_id(folder))
##D ## Verify the file now has multiple parents
##D purrr::pluck(x, "drive_resource", 1, "parents")
##D 
##D ## Update the file with new media AND new metadata
##D x <- x %>%
##D   drive_update(drive_example("chicken.txt"), name = "chicken-poem-again.txt")
##D 
##D ## Clean up
##D drive_rm(x, folder)
## End(Not run)



