library(solrium)


### Name: solr_get
### Title: Real time get
### Aliases: solr_get

### ** Examples

## Not run: 
##D (cli <- SolrClient$new())
##D 
##D # add some documents first
##D ss <- list(list(id = 1, price = 100), list(id = 2, price = 500))
##D add(cli, ss, name = "gettingstarted")
##D 
##D # Now, get documents by id
##D solr_get(cli, ids = 1, "gettingstarted")
##D solr_get(cli, ids = 2, "gettingstarted")
##D solr_get(cli, ids = c(1, 2), "gettingstarted")
##D solr_get(cli, ids = "1,2", "gettingstarted")
##D 
##D # Get raw JSON
##D solr_get(cli, ids = 1, "gettingstarted", raw = TRUE, wt = "json")
##D solr_get(cli, ids = 1, "gettingstarted", raw = TRUE, wt = "xml")
## End(Not run)



