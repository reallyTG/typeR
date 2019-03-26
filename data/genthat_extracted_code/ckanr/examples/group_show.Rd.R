library(ckanr)


### Name: group_show
### Title: Show a package
### Aliases: group_show

### ** Examples

## Not run: 
##D res <- group_list()
##D 
##D # via a group name/id
##D group_show(res[[1]]$name)
##D 
##D # or via an object of class ckan_group
##D group_show(res[[1]])
##D 
##D # return different data formats
##D group_show(res[[1]]$name, as = 'json')
##D group_show(res[[1]]$name, as = 'table')
## End(Not run)



