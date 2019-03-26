library(BDgraph)


### Name: traceplot
### Title: Trace plot of graph size
### Aliases: traceplot

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, size = 7, vis = TRUE )
##D    
##D bdgraph.obj <- bdgraph( data = data.sim, iter = 10000, burnin = 0, save.all = TRUE )
##D    
##D traceplot( bdgraph.obj )
##D    
##D traceplot( bdgraph.obj, acf = TRUE, pacf = TRUE )
## End(Not run)



