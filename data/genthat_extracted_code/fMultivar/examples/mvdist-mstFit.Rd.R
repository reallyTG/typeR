library(fMultivar)


### Name: mvdist-mstFit
### Title: Multivariate Skew Student-t Parameter Estimation
### Aliases: mstFit
### Keywords: math

### ** Examples

## Not run: 
##D ## Load Library:
##D    require(sn)
##D    
##D ## mstFit - 
##D    # Fit Example:
##D    N <- 1000
##D    xi <- c(0, 0) 
##D    Omega <- diag(2); Omega[2,1] <- Omega[1,2] <- 0.5
##D    alpha <- c(2, -2)
##D    nu <- 4
##D    set.seed(4711)
##D    X <- rmst(n=N, xi, Omega, alpha, nu=4)
##D    ans <- mstFit(X)
##D    # Show fitted Parameters:
##D    print(ans)
##D 
##D    # 2-D Density Plot:
##D    plot(hexBinning(X[,1], X[, 2], bins = 30), main="Skew Student-t")
##D    # Add Contours:
##D    N <- 101
##D    x <- seq(min(X[, 1]), max(X[, 1]), l=N)
##D    y <- seq(min(X[, 2]), max(X[, 2]), l=N)        
##D    u <- grid2d(x, y)$x
##D    v <- grid2d(x, y)$y
##D    XY <- cbind(u, v)
##D    param <- ans@fit$dp
##D    Z <- matrix(dmst(
##D      XY, param[[1]][1,], param[[2]], param[[3]], param[[4]]), ncol=N)
##D    contour(x, y, Z, add=TRUE, col="green", lwd=2)
##D    grid(col="brown", lty=3)
##D     
##D ## mstFit - 
##D    # Fit Example with fixed nu=4:
##D    ans <- mstFit(X, fixed.nu=4)
##D    # Show fitted Parameters:
##D    print(ans)
##D    
##D    # 2-D Density Plot:
##D    plot(hexBinning(X[,1], X[, 2], bins = 30), main="Student-t | fixed nu")
##D    # Add Contours:
##D    param <- ans@fit$dp
##D    Z <- matrix(dmst(
##D      XY, param[[1]][1,], param[[2]], param[[3]], nu=4), ncol=N)
##D    contour(x, y, Z, add=TRUE, col="green", lwd=2)
##D    grid(col="brown", lty=3)
## End(Not run)



