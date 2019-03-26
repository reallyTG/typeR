library(solrium)


### Name: delete
### Title: Delete documents by ID or query
### Aliases: delete delete_by_id delete delete_by_query

### ** Examples

## Not run: 
##D (cli <- SolrClient$new())
##D 
##D # add some documents first
##D ss <- list(list(id = 1, price = 100), list(id = 2, price = 500))
##D cli$add(ss, name = "gettingstarted")
##D 
##D # Now, delete them
##D # Delete by ID
##D cli$delete_by_id(ids = 1, "gettingstarted")
##D ## Many IDs
##D cli$delete_by_id(ids = c(3, 4), "gettingstarted")
##D 
##D # Delete by query
##D cli$delete_by_query(query = "manu:bank", "gettingstarted")
## End(Not run)



