library(igraph)


### Name: sample_hierarchical_sbm
### Title: Sample the hierarchical stochastic block model
### Aliases: sample_hierarchical_sbm hierarchical_sbm
### Keywords: graphs graphs, random

### ** Examples


## Ten blocks with three clusters each
C <- matrix(c(1  , 3/4,   0,
              3/4,   0, 3/4,
              0  , 3/4, 3/4), nrow=3)
g <- sample_hierarchical_sbm(100, 10, rho=c(3, 3, 4)/10, C=C, p=1/20)
g
if (require(Matrix)) { image(g[]) }



