library(solrium)


### Name: solr_optimize
### Title: Optimize
### Aliases: solr_optimize

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D solr_optimize(conn, "gettingstarted")
##D solr_optimize(conn, "gettingstarted", max_segments = 2)
##D solr_optimize(conn, "gettingstarted", wait_searcher = FALSE)
##D 
##D # get xml back
##D solr_optimize(conn, "gettingstarted", wt = "xml")
##D ## raw xml
##D solr_optimize(conn, "gettingstarted", wt = "xml", raw = TRUE)
## End(Not run)



