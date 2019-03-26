library(sbtools)


### Name: item_rm_recursive
### Title: Remove an item completely by recursively removing its child
###   items
### Aliases: item_rm_recursive
### Keywords: internal

### ** Examples

## Not run: 
##D # Create an item with nested structure
##D authenticate_sb()
##D fname <- "chairs"
##D folder = folder_create(user_id(), name = fname)
##D item_create(folder, title='child1')
##D item_create(folder, title='child2')
##D 
##D item_list_children(folder)
##D 
##D # then delete the whole folder
##D sbtools:::item_rm_recursive(folder)
## End(Not run)



