library(BDgraph)


### Name: select
### Title: Graph selection
### Aliases: select

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, size = 7, vis = TRUE )
##D   
##D bdgraph.obj <- bdgraph( data = data.sim )
##D    
##D select( bdgraph.obj )
##D   
##D bdgraph.obj <- bdgraph( data = data.sim, save.all = TRUE )
##D   
##D select( bdgraph.obj )
##D   
##D select( bdgraph.obj, cut = 0.5, vis = TRUE )
## End(Not run)



