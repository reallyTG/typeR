library(RiemBase)


### Name: rbase.pdist
### Title: Pairwise Geodesic Distances of a Data Set
### Aliases: rbase.pdist

### ** Examples

## Not run: 
##D ### Generate 10 2-frames in R^4
##D ndata = 10
##D data = array(0,c(4,2,ndata))
##D for (i in 1:ndata){
##D   tgt = matrix(rnorm(4*4),nrow=4)
##D   data[,,i] = qr.Q(qr(tgt))[,1:2]
##D }
##D 
##D ## Compute Pairwise Distances as if for Grassmann and Stiefel Manifold
##D A = rbase.pdist(riemfactory(data,name="grassmann"))
##D B = rbase.pdist(riemfactory(data,name="stiefel"))
##D 
##D ## Visual Comparison in Two Cases
##D par(mfrow=c(1,2), pty="s")
##D image(pracma::flipud(A), col=gray((0:100)/100), main="Grassmann")
##D image(pracma::flipud(B), col=gray((0:100)/100), main="Stiefel")
## End(Not run)




