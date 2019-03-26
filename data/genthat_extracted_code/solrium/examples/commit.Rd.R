library(solrium)


### Name: commit
### Title: Commit
### Aliases: commit

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D conn$commit("gettingstarted")
##D conn$commit("gettingstarted", wait_searcher = FALSE)
##D 
##D # get xml back
##D conn$commit("gettingstarted", wt = "xml")
##D ## raw xml
##D conn$commit("gettingstarted", wt = "xml", raw = TRUE)
## End(Not run)



