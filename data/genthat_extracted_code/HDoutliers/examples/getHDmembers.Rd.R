library(HDoutliers)


### Name: getHDmembers
### Title: Partitioning Stage of the _hdoutliers_ Algorithm
### Aliases: getHDmembers
### Keywords: cluster

### ** Examples


data(dots)
mem.W <- getHDmembers(dots$W)
out.W <- getHDoutliers(dots$W,mem.W)

data(ex2D)
mem.ex2D <- getHDmembers(ex2D)
out.ex2D <- getHDoutliers(ex2D,mem.ex2D)

## Not run: 
##D n <- 100000 # number of observations
##D set.seed(3)
##D x <- matrix(rnorm(2*n),n,2)
##D nout <- 10 # number of outliers
##D x[sample(1:n,size=nout),] <- 10*runif(2*nout,min=-1,max=1)
##D 
##D mem.x <- getHDmembers(x)
##D out.x <- getHDoutliers(x,mem.x)
## End(Not run)




