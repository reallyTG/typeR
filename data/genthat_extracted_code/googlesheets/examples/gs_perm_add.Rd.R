library(googlesheets)


### Name: gs_perm_add
### Title: Add a permission to a spreadsheet
### Aliases: gs_perm_add
### Keywords: internal

### ** Examples

## Not run: 
##D foo <- gs_new("foo")
##D gs_perm_ls(foo)
##D # Add anyone as a reader:
##D gs_perm_add(foo, type = "anyone", role = "reader")
##D gs_perm_ls(foo)
##D gs_delete(foo)
## End(Not run)




