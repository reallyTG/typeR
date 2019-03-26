library(ckanr)


### Name: as.ckan_tag
### Title: ckan_tag class helpers
### Aliases: as.ckan_tag is.ckan_tag

### ** Examples

## Not run: 
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D (tags <- tag_search(query = 'ta'))
##D tags[[3]]
##D 
##D # create item class from only an item ID
##D as.ckan_tag(tags[[3]]$id)
##D 
##D # gives back itself
##D (x <- as.ckan_tag(tags[[3]]$id))
##D as.ckan_tag(x)
## End(Not run)



