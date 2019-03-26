library(googlesheets)


### Name: gs_perm_delete
### Title: Delete a permission from a spreadsheet
### Aliases: gs_perm_delete
### Keywords: internal

### ** Examples

## Not run: 
##D foo <- gs_new("foo")
##D gs_perm_ls(foo)
##D # Add anyone as a reader:
##D gs_perm_add(foo, type = "anyone", role = "reader")
##D gs_perm_ls(foo)
##D # Remove the permission for anyone
##D gs_perm_delete(foo, perm_id = "anyoneWithLink")
##D gs_delete(foo)
## End(Not run)




