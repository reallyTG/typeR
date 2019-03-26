library(fMultivar)


### Name: zzz-mvnorm
### Title: Multivariate Normal Distribution
### Keywords: math

### ** Examples

## Not run: 
##D ## Load Libray:
##D    require(mvtnorm)
##D    
##D ## dmvnorm - 
##D    # Multivariate Normal Density Function:
##D    mean <- c(1, 1)
##D    sigma <- matrix(c(1, 0.5, 0.5, 1), ncol=2) 
##D    dmvnorm(x = c(0, 0),mean, sigma)
##D    
##D ## dmvnorm - 
##D    # Across a Grid:
##D    x <- seq(-4, 4, length=90)
##D    X <- grid2d(x)
##D    X <- cbind(X$x, X$y) 
##D    # Write Density Function:
##D    dmvnorm. <- function(X, mean, sigma)
##D      matrix(apply(X, 1, dmvnorm, mean=mean, sigma=sigma), ncol=sqrt(dim(X)[1]))
##D    z <- dmvnorm.(X, mean, sigma)
##D    contour(list(x = x, y = x, z = z))
##D    
##D ## qmvnorm -
##D    # Equicoordinate Quantile Function:
##D    qmvnorm(p = 0.95, sigma = diag(2), tail = "both")
##D    
##D ## rmvnorm - 
##D    # Random Numbers:
##D    sigma <- matrix(c(4, 2, 2, 3), ncol=2)
##D    x <- rmvnorm(n = 500, mean = c(1, 2), sigma = sigma)
##D    colMeans(x)
##D    var(x)
##D    # Next Generation:
##D    x <- rmvnorm(n = 500, mean = c(1, 2), sigma = sigma, method = "chol")
##D    colMeans(x)
##D    var(x)
##D    plot(x, cex=0.5, pch=19, col="steelblue")
## End(Not run)



