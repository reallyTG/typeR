library(BDgraph)


### Name: pgraph
### Title: Posterior probabilities of the graphs
### Aliases: pgraph

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, size = 6, vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim, save.all = TRUE )
##D    
##D # Estimated posterior probability of the true graph
##D pgraph( bdgraph.obj, adj_g = data.sim )
##D    
##D # Estimated posterior probability of first and second graphs with highest probabilities
##D pgraph( bdgraph.obj, number.g = 2 )
## End(Not run)



