library(BClustLonG)


### Name: calSim
### Title: Function to calculate the similarity matrix based on the cluster
###   membership indicator of each iteration.
### Aliases: calSim

### ** Examples

n = 90 ##number of subjects
iters = 200 ##number of iterations
## matrix of cluster membership indicators
## perfect clustering with three clusters
mat = matrix(rep(1:3,each=n/3),nrow=n,ncol=iters)
sim = calSim(t(mat))



