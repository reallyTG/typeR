library(BDgraph)


### Name: rgcwish
### Title: Sampling from complex G-Wishart distribution
### Aliases: rgcwish

### ** Examples

## Not run: 
##D # Generating a 'circle' graph as a non-decomposable graph
##D adj.g <- graph.sim( p = 5, graph = "circle" )
##D adj.g    # adjacency of graph with 5 nodes
##D    
##D sample <- rgcwish( n = 3, adj.g = adj.g, b = 3, D = diag(5) )
##D round( sample, 2 )  
## End(Not run)



