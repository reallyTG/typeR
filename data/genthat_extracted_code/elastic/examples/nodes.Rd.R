library(elastic)


### Name: nodes
### Title: Elasticsearch nodes endpoints.
### Aliases: nodes nodes_stats nodes_info nodes_hot_threads

### ** Examples

## Not run: 
##D (out <- nodes_stats())
##D nodes_stats(node = names(out$nodes))
##D nodes_stats(metric='get')
##D nodes_stats(metric='jvm')
##D nodes_stats(metric=c('os','process'))
##D nodes_info()
##D nodes_info(metric='process')
##D nodes_info(metric='jvm')
##D nodes_info(metric='http')
##D nodes_info(metric='network')
## End(Not run)



