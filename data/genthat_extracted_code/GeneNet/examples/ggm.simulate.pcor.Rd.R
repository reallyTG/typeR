library(GeneNet)


### Name: ggm.simulate.pcor
### Title: Graphical Gaussian Models: Simulation of Networks
### Aliases: ggm.simulate.pcor
### Keywords: multivariate

### ** Examples

## Not run: 
##D 
##D # load GeneNet library
##D library("GeneNet")
##D 
##D # generate random network with 40 nodes 
##D # it contains 780=40*39/2 edges of which 5 percent (=39) are non-zero
##D true.pcor <- ggm.simulate.pcor(40)
##D   
##D # simulate data set with 40 observations
##D m.sim <- ggm.simulate.data(40, true.pcor)
##D 
##D # simple estimate of partial correlations
##D estimated.pcor <- cor2pcor( cor(m.sim) )
##D 
##D # comparison of estimated and true values
##D sum((true.pcor-estimated.pcor)^2)
##D 
##D # a slightly better estimate ...
##D estimated.pcor.2 <- ggm.estimate.pcor(m.sim)
##D sum((true.pcor-estimated.pcor.2)^2)
##D 
## End(Not run)



