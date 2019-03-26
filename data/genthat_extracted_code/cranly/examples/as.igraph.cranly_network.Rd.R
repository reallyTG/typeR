library(cranly)


### Name: as.igraph.cranly_network
### Title: Coerce a 'cranly_network' to an 'graph' object
### Aliases: as.igraph.cranly_network

### ** Examples

## Not run: 
##D 
##D #' cran_db <- clean_CRAN_db()
##D ## Package directives network
##D package_network <- build_network(object = cran_db, perspective = "package")
##D igraph::as.igraph(package_network)
##D 
##D ## Author collaboration network
##D author_network <- build_network(object = cran_db, perspective = "author")
##D igraph::as.igraph(author_network)
##D 
## End(Not run)



