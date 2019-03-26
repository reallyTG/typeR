library(HDoutliers)


### Name: getHDoutliers
### Title: Outlier Detection Stage of Wilkinson's _hdoutliers_ Algorithm
### Aliases: getHDoutliers
### Keywords: cluster

### ** Examples


data(dots)
mem.W <- getHDmembers(dots$W)
out.W <- getHDoutliers(dots$W,mem.W)
## Not run: 
##D plotHDoutliers( dots.W, out.W)
## End(Not run)

data(ex2D)
mem.ex2D <- getHDmembers(ex2D)
out.ex2D <- getHDoutliers( ex2D, mem.ex2D)
## Not run: 
##D plotHDoutliers( ex2D, out.ex2D)
## End(Not run)

## Not run: 
##D n <- 100000 # number of observations
##D set.seed(3)
##D x <- matrix(rnorm(2*n),n,2)
##D nout <- 10 # number of outliers
##D x[sample(1:n,size=nout),] <- 10*runif(2*nout,min=-1,max=1)
##D 
##D mem.x <- getHDmembers(x)
##D out.x <- getHDoutliers(x)
## End(Not run)




