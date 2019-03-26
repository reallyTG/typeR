library(BDgraph)


### Name: plotcoda
### Title: Convergence plot
### Aliases: plotcoda

### ** Examples

## Not run: 
##D # Generating multivariate normal data from a 'circle' graph
##D data.sim <- bdgraph.sim( n = 50, p = 6, graph = "circle", vis = TRUE )
##D   
##D bdgraph.obj <- bdgraph( data = data.sim, iter = 10000, burnin = 0 , save.all = TRUE )
##D    
##D plotcoda( bdgraph.obj )  
## End(Not run)



