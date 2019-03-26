library(cranly)


### Name: plot.cranly_network
### Title: Interactive visualization of a package or author
###   'cranly_network'
### Aliases: plot.cranly_network

### ** Examples

## Not run: 
##D cran_db <- clean_CRAN_db()
##D package_network <- build_network(cran_db)
##D ## The package directives network of all users with Ioannis in
##D ## their name from the CRAN database subset cran_db
##D plot(package_network, author = "Ioannis")
##D ## The package directives network of "Achim Zeileis"
##D plot(package_network, author = "Achim Zeileis")
##D 
##D author_network <- build_network(cran_db, perspective = "author")
##D plot(author_network, author = "Ioannis", title = TRUE)
## End(Not run)



