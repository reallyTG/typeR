library(BDgraph)


### Name: bdgraph.mpl
### Title: Search algorithm in graphical models using marginal
###   pseudo-likehlihood
### Aliases: bdgraph.mpl

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 70, p = 6, size = 7, vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph.mpl( data = data.sim )
##D   
##D summary( bdgraph.obj )
##D    
##D # To compare our result with true graph
##D compare( data.sim, bdgraph.obj, main = c( "True graph", "BDgraph" ) )
## End(Not run)



