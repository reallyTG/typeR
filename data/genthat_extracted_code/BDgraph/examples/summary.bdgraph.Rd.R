library(BDgraph)


### Name: summary.bdgraph
### Title: Summary function for 'S3' class '"bdgraph"'
### Aliases: summary.bdgraph

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, size = 7, vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim )
##D    
##D summary( bdgraph.obj )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim, save.all = TRUE )
##D    
##D summary( bdgraph.obj )
##D    
##D summary( bdgraph.obj, vis = FALSE )
## End(Not run)



