library(spatialprobit)


### Name: sar_eigs
### Title: compute the eigenvalues for the spatial weight matrix W
### Aliases: sar_eigs

### ** Examples

set.seed(123)
# sparse matrix representation for spatial weight matrix W (d x d) 
# and m nearest neighbors
d <- 100
m <- 6
W <- sparseMatrix(i=rep(1:d, each=m), 
  j=replicate(d, sample(x=1:d, size=m, replace=FALSE)), x=1/m, dims=c(d, d))
sar_eigs(eflag=1, W)    



