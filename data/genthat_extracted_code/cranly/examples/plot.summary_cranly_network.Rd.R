library(cranly)


### Name: plot.summary_cranly_network
### Title: Top-n package or author barplots according to a range of network
###   statistics
### Aliases: plot.summary_cranly_network

### ** Examples


## Not run: 
##D cran_db <- clean_CRAN_db()
##D ## package network
##D package_network <- build_network(cran_db)
##D package_summaries <- summary(package_network)
##D plot(package_summaries, according_to = "n_imported_by", top = 30)
##D plot(package_summaries, according_to = "n_depended_by", top = 30)
##D plot(package_summaries, according_to = "page_rank", top = 30)
##D 
##D ## author network
##D author_network <- build_network(cran_db, perspective = "author")
##D author_summaries <- summary(author_network)
##D plot(author_summaries, according_to = "n_collaborators", top = 30)
##D plot(author_summaries, according_to = "n_packages", top = 30)
##D plot(author_summaries, according_to = "page_rank", top = 30)
## End(Not run)




