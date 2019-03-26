library(solrium)


### Name: config_params
### Title: Set Solr configuration params
### Aliases: config_params

### ** Examples

## Not run: 
##D # start Solr in standard or Cloud mode
##D # connect
##D (conn <- SolrClient$new())
##D 
##D # set a parameter set
##D myFacets <- list(myFacets = list(facet = TRUE, facet.limit = 5))
##D config_params(conn, "gettingstarted", set = myFacets)
##D 
##D # check a parameter
##D config_params(conn, "gettingstarted", param = "myFacets")
## End(Not run)



