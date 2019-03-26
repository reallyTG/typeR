library(SparseGrid)


### Name: createMonteCarloGrid
### Title: Create a multidimensional grid of nodes and weights for Monte
###   Carlo integration
### Aliases: createMonteCarloGrid
### Keywords: distribution multivariate

### ** Examples

# load library
library('SparseGrid')

# set random seed
set.seed( 3141 )

# Create Monte Carlo integration grids
# 1. with draws from a uniform distribution
mc.grid <- createMonteCarloGrid( runif, dimension=2, num.sim=10 )
mc.grid

# 2. with draws from a standard normal distribution
mc.grid <- createMonteCarloGrid( rnorm, dimension=3, num.sim=1000 )

# 3. with draws from a normal distribution with mean=2 and sd=5
mc.grid <- createMonteCarloGrid( rnorm, dimension=3, num.sim=1000, mean=2, sd=5 )



