library(BDgraph)


### Name: plotroc
### Title: ROC plot
### Aliases: plotroc

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 30, p = 6, size = 7, vis = TRUE )
##D    
##D # Runing sampling algorithm
##D bdgraph.obj <- bdgraph( data = data.sim, iter = 10000 )
##D # Comparing the results
##D plotroc( data.sim, bdgraph.obj )
##D    
##D # To compare the results based on CGGMs approach
##D bdgraph.obj2 <- bdgraph( data = data.sim, method = "gcgm", iter = 10000 )
##D # Comparing the resultss
##D plotroc( data.sim, bdgraph.obj, bdgraph.obj2, label = FALSE )
##D legend( "bottomright", c( "GGMs", "GCGMs" ), lty = c( 1,2 ), col = c( "black", "red" ) )   
## End(Not run)



