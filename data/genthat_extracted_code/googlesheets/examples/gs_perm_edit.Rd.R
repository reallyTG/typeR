library(googlesheets)


### Name: gs_perm_edit
### Title: Edit an existing permission
### Aliases: gs_perm_edit
### Keywords: internal

### ** Examples

## Not run: 
##D foo <- gs_new("foo")
##D gs_perm_ls(foo)
##D # Add anyone as a reader:
##D gs_perm_add(foo, type = "anyone", role = "reader")
##D gs_perm_ls(foo)
##D # Change anyone to a writer:
##D gs_perm_edit(foo, perm_id = "anyoneWithLink", role = "writer")
##D gs_perm_ls(foo)
##D gs_delete(foo)
## End(Not run)




