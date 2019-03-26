library(BDgraph)


### Name: bdgraph.sim
### Title: Graph data simulation
### Aliases: bdgraph.sim

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( p = 10, n = 50, prob = 0.3, vis = TRUE )
##D print( data.sim )
##D      
##D # Generating multivariate normal data from a 'hub' graph
##D data.sim <- bdgraph.sim( p = 6, n = 3, graph = "hub", vis = FALSE )
##D round( data.sim $ data, 2 )
##D      
##D # Generating mixed data from a 'hub' graph 
##D data.sim <- bdgraph.sim( p = 8, n = 10, graph = "hub", type = "mixed" )
##D round( data.sim $ data, 2 )
##D 
##D # Generating only a 'scale-free' graph (with no data) 
##D graph.sim <- bdgraph.sim( p = 8, graph = "scale-free" )
##D plot( graph.sim )
##D graph.sim $ G
## End(Not run)



