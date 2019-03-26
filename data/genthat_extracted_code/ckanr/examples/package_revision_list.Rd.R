library(ckanr)


### Name: package_revision_list
### Title: Return a dataset (package's) revisions as a list of
###   dictionaries.
### Aliases: package_revision_list

### ** Examples

## Not run: 
##D # Setup
##D ckanr_setup(url = "http://demo.ckan.org/", key = getOption("ckan_demo_key"))
##D 
##D # create a package
##D (res <- package_create("dolphins"))
##D 
##D # list package revisions
##D package_revision_list(res$id)
##D 
##D # Make change to the package
##D x <- list(title = "dolphins and things")
##D package_patch(x, id = res$id)
##D 
##D # list package revisions
##D package_revision_list(res$id)
##D 
##D # Output different formats
##D package_revision_list(res$id, as = "table")
##D package_revision_list(res$id, as = "json")
## End(Not run)



