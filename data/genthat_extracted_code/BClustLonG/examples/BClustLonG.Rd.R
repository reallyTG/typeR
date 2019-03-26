library(BClustLonG)


### Name: BClustLonG
### Title: A Dirichlet process mixture model for clustering longitudinal
###   gene expression data.
### Aliases: BClustLonG

### ** Examples

data(data)
## increase the number of iterations
## to ensure convergence of the algorithm

res = BClustLonG(data, iter=20, thin=2,savePara=FALSE,
infoVar="both",factor=TRUE)
## discard the first 10 burn-ins in the e.mat
## and calculate similarity matrix
## the number of burn-ins has be chosen s.t. the algorithm is converged.
mat = calSim(t(res$e.mat[,11:20]))
clust = maxpear(mat)$cl ## the clustering results.
## Not run: 
##D ## if only want to include intercepts for clustering
##D ## set infoVar="int"
##D res = BClustLonG(data, iter=10, thin=2,savePara=FALSE,
##D infoVar="int",factor=TRUE)
##D 
##D ## if no factor analysis model is wanted
##D ## set factor=FALSE
##D res = BClustLonG(data, iter=10, thin=2,savePara=FALSE,
##D infoVar="int",factor=TRUE)
## End(Not run)



