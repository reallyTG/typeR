library(SparseGrid)


### Name: createSparseGrid
### Title: Create sparse grid
### Aliases: createSparseGrid SparseGrid
### Keywords: distribution multivariate

### ** Examples

# load library
library('SparseGrid')

# define function to be integrated
# g(x) = x[1] * x[2] * ... * x[n]
g <- function( x ) {
	return( prod( x ) )
}

#
# Create sparse integration grid to approximate integral of a function with uniform weights
#
sp.grid <- createSparseGrid( 'KPU', dimension=3, k=5 )

# number of nodes and weights
length( sp.grid$weights )

# evaluate function g in nodes
gx.sp <- apply( sp.grid$nodes, 1, g )

# take weighted sum to get approximation for the integral
val.sp <- gx.sp %*% sp.grid$weights

#
# Create integration grid to approximate integral of a function with uniform weights
#
pr.grid <- createProductRuleGrid( 'KPU', dimension=3, k=5 )

# number of nodes and weights
length( pr.grid$weights )

# evaluate function g in nodes
gx.pr <- apply( pr.grid$nodes, 1, g )

# take weighted sum to get approximation for the integral
val.pr <- gx.pr %*% pr.grid$weights

#
# Create integration grid to approximation integral using Monte Carlo simulation
#
set.seed( 3141 )
mc.grid <- createMonteCarloGrid( runif, dimension=3, num.sim=1000 )

# number of nodes and weights
length( mc.grid$weights )

# evaluate function g in MC nodes
gx.mc   <- apply( mc.grid$nodes, 1, g )

# take weighted sum to get approximation for the integral
# the weights are all equal to 1/1000 in this case
val.mc <- gx.mc %*% mc.grid$weights

val.sp
val.pr
val.mc



