library(NMF)


### Name: connectivity
### Title: Clustering Connectivity and Consensus Matrices
### Aliases: connectivity connectivity,ANY-method
###   connectivity,factor-method connectivity-methods
###   connectivity,NMF-method connectivity,numeric-method consensus
###   consensus-methods consensus,NMFfitX-method consensus,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

#----------
# connectivity,ANY-method
#----------
# clustering of random data
h <- hclust(dist(rmatrix(10,20)))
connectivity(cutree(h, 2))

#----------
# connectivity,factor-method
#----------
connectivity(gl(2, 4))



