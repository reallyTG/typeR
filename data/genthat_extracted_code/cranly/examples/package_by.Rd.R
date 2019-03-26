library(cranly)


### Name: package_by
### Title: Find packages and authors by authors or packages with names
###   matching a specific string
### Aliases: package_by package_with author_with author_of suggests imports
###   depends linking_to enhances package_by.cranly_network
###   package_with.cranly_network author_of.cranly_network
###   author_with.cranly_network suggests.cranly_network
###   imports.cranly_network depends.cranly_network
###   linking_to.cranly_network enhances.cranly_network

### ** Examples

## Not run: 
##D cran_db <- clean_CRAN_db()
##D ## Using a package directives network
##D package_network <- build_network(cran_db)
##D ## Find all packages containing glm in their name
##D package_with(package_network, name = "glm")
##D ## Find all authors of packages containing brglm in their name
##D author_of(package_network, package = "rglm", exact = FALSE)
##D ## Find all packages with brglm in their name
##D package_with(package_network, name = "rglm", exact = FALSE)
##D ## Find all authors of the package brglm2
##D author_of(package_network, package = "brglm2", exact = TRUE)
##D ## Find all authors with Ioannis in their name
##D author_with(package_network, name = "Ioannis", exact = TRUE)
##D ## Find all packages that package Rcpp suggests
##D suggests(package_network, package = "Rcpp", exact = TRUE)
##D ## Find all packages that package Rcpp imports
##D imports(package_network, package = "Rcpp", exact = TRUE)
##D ## Find all packages that package RcppArmadillo is linking to
##D linking_to(package_network, package = "RcppArmadillo", exact = TRUE)
##D 
##D ## Using an author collaboration network
##D author_network <- build_network(cran_db, perspective = "author")
##D ## Find all packages containing glm in their name
##D package_with(author_network, name = "glm")
##D ## Find all authors of packages containing brglm in their name
##D author_of(author_network, package = "rglm", exact = FALSE)
##D ## Find all packages with brglm in their name
##D package_with(author_network, name = "rglm", exact = FALSE)
##D ## Find all authors of the package brglm2
##D author_of(author_network, package = "brglm2", exact = TRUE)
##D ## Find all authors with Ioannis in their name
##D author_with(author_network, name = "Ioannis", exact = TRUE)
## End(Not run)



