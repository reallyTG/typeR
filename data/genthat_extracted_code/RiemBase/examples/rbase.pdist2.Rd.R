library(RiemBase)


### Name: rbase.pdist2
### Title: Pairwise Geodesic Distances Between Two Sets of Data
### Aliases: rbase.pdist2

### ** Examples

## Not run: 
##D ### Generate 10 2-frames in R^4 : as grassmann points
##D ndata = 10
##D data = array(0,c(4,2,ndata))
##D for (i in 1:ndata){
##D   tgt = matrix(rnorm(4*4),nrow=4)
##D   data[,,i] = qr.Q(qr(tgt))[,1:2]
##D }
##D 
##D gdata = riemfactory(data, name="grassmann")
##D 
##D ## Compute Pairwise Distances using pdist and pdist2
##D A = rbase.pdist(gdata)
##D B = rbase.pdist2(gdata,gdata)
##D 
##D ## Visual Comparison in Two Cases
##D par(mfrow=c(1,2), pty="s")
##D image(pracma::flipud(A), col=gray((0:100)/100), main="pdist")
##D image(pracma::flipud(B), col=gray((0:100)/100), main="pdist2")
## End(Not run)




