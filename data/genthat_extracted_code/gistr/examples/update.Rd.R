library(gistr)


### Name: update
### Title: Update/modify a gist
### Aliases: update

### ** Examples

## Not run: 
##D file1 <- system.file("examples", "alm.md", package = "gistr")
##D file2 <- system.file("examples", "zoo.json", package = "gistr")
##D 
##D # add new files
##D gists(what = "minepublic")[[3]] %>%
##D  add_files(file1, file2) %>%
##D  update()
##D 
##D # update existing files
##D ### file name has to match to current name
##D gists(what = "minepublic")[[3]] %>%
##D  update_files(file1) %>%
##D  update()
##D 
##D # delete existing files
##D ### again, file name has to match to current name
##D gists(what = "minepublic")[[3]] %>%
##D  delete_files(file1, file2) %>%
##D  update()
##D 
##D # rename existing files
##D # For some reason, this operation has to upload the content too
##D ### first name is old file name with path (must match), and second is 
##D ### new file name (w/o path)
##D ## add first
##D gists(what = "minepublic")[[3]] %>%
##D  add_files(file1, file2) %>%
##D  update()
##D ## then rename
##D gists(what = "minepublic")[[3]] %>%
##D  rename_files(list(file1, "newfile.md")) %>%
##D  update()
##D ### you can pass in many renames
##D gists(what = "minepublic")[[3]] %>%
##D  rename_files(list(file1, "what.md"), list(file2, "new.json")) %>%
##D  update()
## End(Not run)



