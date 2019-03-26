library(ckanr)


### Name: tag_show
### Title: Show a tag.
### Aliases: tag_show

### ** Examples

## Not run: 
##D # get tags with tag_list()
##D tags <- tag_list()
##D tags[[30]]$id
##D 
##D # show a tag
##D (x <- tag_show(tags[[30]]$id))
##D 
##D # give back different data formats
##D tag_show(tags[[30]]$id, as = 'json')
##D tag_show(tags[[30]]$id, as = 'table')
## End(Not run)



