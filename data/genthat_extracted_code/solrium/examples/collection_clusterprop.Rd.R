library(solrium)


### Name: collection_clusterprop
### Title: Add, edit, delete a cluster-wide property
### Aliases: collection_clusterprop

### ** Examples

## Not run: 
##D (conn <- SolrClient$new())
##D 
##D # add the value https to the property urlScheme
##D collection_clusterprop(conn, name = "urlScheme", val = "https")
##D 
##D # status again
##D collection_clusterstatus(conn)$cluster$properties
##D 
##D # delete the property urlScheme by setting val to NULL or a 0 length string
##D collection_clusterprop(conn, name = "urlScheme", val = "")
## End(Not run)



