library(fMultivar)


### Name: mvdist-mscFit
### Title: Multivariate Skew Cauchy Parameter Estimation
### Aliases: mscFit
### Keywords: math

### ** Examples

## Not run: 
##D ## Load Library:
##D    require(sn)
##D    
##D ## mscFit - 
##D    # Fit Example:
##D    N <- 1000
##D    xi <- c(0, 0) 
##D    Omega <- diag(2); Omega[2,1] <- Omega[1,2] <- 0.5
##D    alpha <- c(2, -6)
##D    set.seed(4711)
##D    X <- rmsc(n=N, xi, Omega, alpha)
##D    ans <- mscFit(X)
##D    # Show fitted Parameters:
##D    print(ans)
##D    
##D    # 2-D Density Plot:
##D    plot(hexBinning(X[,1], X[, 2], bins = 30), main="Skew Cauchy")
##D    # Add Contours:
##D    N <- 101
##D    x <- seq(min(X[, 1]), max(X[, 1]), l=N)
##D    y <- seq(min(X[, 2]), max(X[, 2]), l=N)        
##D    u <- grid2d(x, y)$x
##D    v <- grid2d(x, y)$y
##D    XY <- cbind(u, v)
##D    param <- ans@fit$dp
##D    Z <- matrix(dmsc(XY, param[[1]][1,], param[[2]], param[[3]]), ncol=N)
##D    contour(x, y, Z, add=TRUE, col="green", lwd=2)
##D    grid(col="brown", lty=3)
##D    
##D ## Cut the Tails:
##D    CUT <- 25
##D    X <- X[abs(X[, 1]) <= CUT, ] 
##D    X <- X[abs(X[, 2]) <= CUT, ]   
##D    plot(hexBinning(X[,1], X[, 2], bins = 30), main="Skew Cauchy")
##D    x <- y <- seq(-CUT, CUT, l=N) 
##D    u <- grid2d(x, y)$x
##D    v <- grid2d(x, y)$y
##D    XY <- cbind(u, v)
##D    param <- ans@fit$dp
##D    Z <- matrix(dmsc(XY, param[[1]][1,], param[[2]], param[[3]]), ncol=N)
##D    contour(x, y, Z, add=TRUE, col="green", lwd=2)
##D    grid(col="brown", lty=3)
##D    # Try larger cuts ...
## End(Not run)



