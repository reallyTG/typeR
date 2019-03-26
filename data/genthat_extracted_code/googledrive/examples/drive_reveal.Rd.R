library(googledrive)


### Name: drive_reveal
### Title: Add column(s) with new information
### Aliases: drive_reveal

### ** Examples

## Not run: 
##D ## Get a nice, random selection of files
##D files <- drive_find(n_max = 10, trashed = NA)
##D 
##D ## Reveal
##D ##   * paths (warning: can be slow for many files!)
##D ##   * if `trashed` or not
##D ##   * MIME type
##D ##   * permissions, i.e. sharing status
##D ##   * if `published` or not
##D drive_reveal(files, "path")
##D drive_reveal(files, "trashed")
##D drive_reveal(files, "mime_type")
##D drive_reveal(files, "permissions")
##D drive_reveal(files, "published")
##D 
##D ## 'root' is a special file id that always represents your root folder
##D drive_get(id = "root") %>% drive_reveal("path")
## End(Not run)



