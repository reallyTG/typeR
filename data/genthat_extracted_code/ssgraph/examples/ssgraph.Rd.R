library(ssgraph)


### Name: ssgraph
### Title: Algorithm for graphical models using spike-and-slab priors
### Aliases: ssgraph

### ** Examples

# Generating multivariate normal data from a 'random' graph
data.sim <- bdgraph.sim( n = 80, p = 7, prob = 0.5, vis = TRUE )

# Running algorithm based on GGMs
ssgraph.obj <- ssgraph( data = data.sim, iter = 1000 )

summary( ssgraph.obj )

# To compare the result with true graph
compare( data.sim, ssgraph.obj, main=c("True graph", "ssgraph"), vis=TRUE )

## Not run: 
##D 
##D # Running algorithm with starting points from previous run
##D ssgraph.obj2 <- ssgraph( data = data.sim, iter=5000, g.start = ssgraph.obj )
##D     
##D compare( data.sim, ssgraph.obj, ssgraph.obj2, 
##D          main = c( "True graph", "Frist run", "Second run" ) )
## End(Not run)



