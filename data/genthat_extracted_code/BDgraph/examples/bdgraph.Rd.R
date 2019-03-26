library(BDgraph)


### Name: bdgraph
### Title: Search algorithm in graphical models
### Aliases: bdgraph

### ** Examples

## Not run: 
##D # --- Example 1
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 20, p = 6, size = 7, vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim, iter = 1000 )
##D   
##D summary( bdgraph.obj )
##D    
##D # To compare our result with true graph
##D compare( data.sim, bdgraph.obj, main = c( "True graph", "BDgraph" ) )
##D    
##D # Running algorithm with starting points from previous run
##D bdgraph.obj2 <- bdgraph( data = data.sim, g.start = bdgraph.obj )
##D     
##D compare( data.sim, bdgraph.obj, bdgraph.obj2, 
##D          main = c( "True graph", "Frist run", "Second run" ) )
##D 
##D    
##D # --- Example 2
##D # Generating mixed data from a 'scale-free' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, type = "mixed", graph = "scale-free", vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim, method = "gcgm", iter = 10000 )
##D   
##D summary( bdgraph.obj )
##D    
##D compare( data.sim, bdgraph.obj )
## End(Not run)	  



