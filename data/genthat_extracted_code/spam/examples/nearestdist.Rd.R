library(spam)


### Name: nearestdist
### Title: Distance Matrix Computation
### Aliases: dist.spam nearest.dist distance
### Keywords: array algebra

### ** Examples

# Note that upper=T and using t(X)+X is quicker than upper=NULL;
#     upper=T marginally slower than upper=F.

# To compare nearest.dist with dist, use as.dist(...)
nx <- 4
x <- expand.grid(as.double(1:nx),as.double(1:nx))
sum( ( as.dist(nearest.dist( x, delta=nx*2))-
          dist(x)                            )^2)

# Create nearest neighbor structures:
par(mfcol=c(1,2))
x <- expand.grid(1:nx,1:(2*nx))
display( nearest.dist( x, delta=1))
x <- expand.grid(1:(2*nx),1:nx)
display( nearest.dist( x, delta=1))




