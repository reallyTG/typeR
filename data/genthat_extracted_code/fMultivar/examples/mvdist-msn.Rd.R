library(fMultivar)


### Name: mvdist-msn
### Title: Multivariate Skew-Normal Distribution
### Keywords: math

### ** Examples

## Not run: 
##D ## Make 2-D Grid Coordinates:
##D    N <- 101
##D    x <- y <- seq(-3, 3, l=N)
##D    X <- cbind(u=grid2d(x)$x, v=grid2d(x)$y)
##D    
##D ## dmsn
##D    # Set Parameters:
##D    xi <- c(0, 0) 
##D    Omega <- diag(2); Omega[2,1] <- Omega[1,2] <- 0.5
##D    alpha <- c(2, -6)
##D    # Compute skew Normal Density:
##D    z <- sn::dmsn(X, xi, Omega, alpha)
##D    Z <- list(x=x, y=x, z=matrix(z, ncol = length(x)))
##D    # Plot:   
##D    image(Z)
##D    contour(Z)
##D    grid(col="red")
##D    
##D ## rmsn - 
##D    set.seed(4711)
##D    r <- sn::rmsn(n=5000, xi, Omega, alpha)
##D    plot(hexBinning(r))
##D    contour(Z, add=TRUE, col="darkblue", lwd=2)
##D    grid(col="red")
## End(Not run)



