library(BDgraph)


### Name: plot.bdgraph
### Title: Plot function for 'S3' class '"bdgraph"'
### Aliases: plot.bdgraph

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, size = 7, vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim )
##D    
##D plot( bdgraph.obj )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim, save.all = TRUE )
##D    
##D plot( bdgraph.obj, number.g = 4 )
##D   
##D plot( bdgraph.obj, cut = 0.4 )
## End(Not run)



