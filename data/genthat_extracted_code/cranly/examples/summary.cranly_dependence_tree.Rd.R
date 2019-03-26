library(cranly)


### Name: summary.cranly_dependence_tree
### Title: summary method for 'cranly_dependence_tree' objects
### Aliases: summary.cranly_dependence_tree

### ** Examples

## Not run: 
##D cran_db <- clean_CRAN_db()
##D package_network <- build_network(object = cran_db)
##D 
##D ## Two light packages
##D dep_tree <- build_dependence_tree(package_network, package = "brglm")
##D summary(dep_tree)
##D 
##D dep_tree <- build_dependence_tree(package_network, package = "gnm")
##D summary(dep_tree)
##D 
##D ## A somewhat heavier package (sorry)...
##D dep_tree <- build_dependence_tree(package_network, package = "cranly")
##D summary(dep_tree)
##D 
## End(Not run)




