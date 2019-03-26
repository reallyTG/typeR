library(sbtools)


### Name: query_item_identifier
### Title: Query SB for items based on custom identifier
### Aliases: query_item_identifier

### ** Examples

## Not run: 
##D authenticate_sb()
##D 
##D ex_item = item_create(title='identifier example')
##D item_update_identifier(ex_item, 'project1', 'dataset1', 'key1')
##D ex2_item = item_create(title='identifier example 2')
##D item_update_identifier(ex2_item, 'project1', 'dataset1', 'key2')
##D 
##D 
##D #query the specific item
##D query_item_identifier('project1', 'dataset1', 'key1')
##D 
##D #or get the collection of items based on the ID hierarchy
##D query_item_identifier('project1')
##D 
##D item_rm(ex_item)
##D item_rm(ex2_item)
## End(Not run)




