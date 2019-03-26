library(elastic)


### Name: cat
### Title: Use the cat Elasticsearch api.
### Aliases: cat cat_ cat_aliases cat_allocation cat_count cat_segments
###   cat_health cat_indices cat_master cat_nodes cat_nodeattrs
###   cat_pending_tasks cat_plugins cat_recovery cat_thread_pool cat_shards
###   cat_fielddata

### ** Examples

## Not run: 
##D # list Elasticsearch cat endpoints
##D cat_()
##D 
##D # Do other cat operations
##D cat_aliases()
##D cat_aliases(index='plos')
##D cat_allocation()
##D cat_allocation(verbose=TRUE)
##D cat_count()
##D cat_count(index='plos')
##D cat_count(index='gbif')
##D cat_segments()
##D cat_segments(index='gbif')
##D cat_health()
##D cat_indices()
##D cat_master()
##D cat_nodes()
##D # cat_nodeattrs() # not available in older ES versions
##D cat_pending_tasks()
##D cat_plugins()
##D cat_recovery(verbose=TRUE)
##D cat_recovery(index='gbif')
##D cat_thread_pool()
##D cat_thread_pool(verbose=TRUE)
##D cat_shards()
##D cat_fielddata()
##D cat_fielddata(fields='body')
##D 
##D # capture cat data into a data.frame
##D cat_(parse = TRUE)
##D cat_indices(parse = TRUE)
##D cat_indices(parse = TRUE, verbose = TRUE)
##D cat_count(parse = TRUE)
##D cat_count(parse = TRUE, verbose = TRUE)
##D cat_health(parse = TRUE)
##D cat_health(parse = TRUE, verbose = TRUE)
##D 
##D # Get help - what does each column mean
##D head(cat_indices(help = TRUE, parse = TRUE))
##D cat_health(help = TRUE, parse = TRUE)
##D head(cat_nodes(help = TRUE, parse = TRUE))
##D 
##D # Get back only certain fields
##D cat_nodes()
##D cat_nodes(h = c('ip','port','heapPercent','name'))
##D cat_nodes(h = c('id', 'ip', 'port', 'v', 'm'))
##D cat_indices(verbose = TRUE)
##D cat_indices(verbose = TRUE, h = c('index','docs.count','store.size'))
##D 
##D # Get back machine friendly numbers instead of the normal human friendly
##D cat_indices(verbose = TRUE, bytes = TRUE)
##D 
##D # Curl options
##D library("httr")
##D cat_count(config=verbose())
## End(Not run)



