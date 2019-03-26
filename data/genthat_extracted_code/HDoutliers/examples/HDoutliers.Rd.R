library(HDoutliers)


### Name: HDoutliers
### Title: Leland Wilkinson's _hdoutliers_ Algorithm for Outlier Detection
### Aliases: HDoutliers
### Keywords: cluster

### ** Examples


data(dots)
out.W <- HDoutliers(dots$W)
## Not run: 
##D plotHDoutliers(dots$W,out.W)
## End(Not run)

data(ex2D)
out.ex2D <- HDoutliers(ex2D)
## Not run: 
##D plotHDoutliers(ex2D,out.ex2D)
## End(Not run)

## Not run: 
##D n <- 100000 # number of observations
##D set.seed(3)
##D x <- matrix(rnorm(2*n),n,2)
##D nout <- 10 # number of outliers
##D x[sample(1:n,size=nout),] <- 10*runif(2*nout,min=-1,max=1)
##D 
##D out.x <- HDoutliers(x)
## End(Not run)



