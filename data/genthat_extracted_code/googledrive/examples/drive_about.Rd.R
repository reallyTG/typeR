library(googledrive)


### Name: drive_about
### Title: Get info on Drive capabilities
### Aliases: drive_about

### ** Examples

## Not run: 
##D drive_about()
##D 
##D ## explore the names of available Team Drive themes
##D about <- drive_about()
##D about[["teamDriveThemes"]] %>%
##D   purrr::map_chr("id")
## End(Not run)



