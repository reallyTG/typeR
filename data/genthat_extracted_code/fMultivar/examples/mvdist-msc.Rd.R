library(fMultivar)


### Name: mvdist-msc
### Title: Multivariate Skew Cauchy Distribution
### Keywords: math

### ** Examples

## Not run: 
##D ## grid2d - 
##D    # Make 2-D Grid Coordinates:
##D    N <- 101
##D    x <- y <- seq(-3, 3, l=N)
##D    X <- cbind(u=grid2d(x)$x, v=grid2d(x)$y)
##D    
##D ## Set Parameters:
##D    xi <- c(0, 0) 
##D    Omega <- diag(2); Omega[2,1] <- Omega[1,2] <- 0.5
##D    alpha <- c(2, -6)
##D    
##D ## dmsc - 
##D    # Compute skew Cauchy Density:
##D    z <- sn::dmsc(X, xi, Omega, alpha)
##D    Z <- list(x=x, y=x, z=matrix(z, ncol = length(x)))
##D    # Plot:   
##D    image(Z, main ="Skew Cauchy Density")
##D    contour(Z, add=TRUE)
##D    grid(col="red")
##D 
##D ## pmsc - 
##D    # Compute skew Cauchy Probability:
##D    z <- NULL
##D    for (i in 1:nrow(X)) z <- c(z, sn::pmsc(X[i, ], xi, Omega, alpha)[[1]])
##D    Z <- list(x=x, y=x, z=matrix(z, ncol = length(x)))
##D    # Plot:   
##D    image(Z, main ="Skew Cauchy Probability")
##D    contour(Z, add=TRUE)
##D    grid(col="red")
##D    
##D ## rmsc - 
##D    # Skew Cauchy Random Deviates:
##D    set.seed(4711)
##D    r <- sn::rmsc(10000, xi, Omega, alpha)
##D    plot(hexBinning(r[, 1], r[, 2]))
##D    # Note, we have fat tails ...
## End(Not run)



