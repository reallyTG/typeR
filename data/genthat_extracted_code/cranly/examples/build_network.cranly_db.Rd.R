library(cranly)


### Name: build_network.cranly_db
### Title: Compute edges and nodes of package directives and collaboration
###   networks
### Aliases: build_network.cranly_db cranly_network

### ** Examples

## Not run: 
##D cran_db <- clean_CRAN_db()
##D ## Package directives network
##D package_network <- build_network(object = cran_db, perspective = "package")
##D head(package_network$edges)
##D head(package_network$nodes)
##D attr(package_network, "timestamp")
##D class(package_network)
##D 
##D ## Author collaboration network
##D author_network <- build_network(object = cran_db, perspective = "author")
##D head(author_network$edges)
##D head(author_network$nodes)
##D attr(author_network, "timestamp")
##D class(author_network)
## End(Not run)




