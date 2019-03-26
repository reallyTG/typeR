library(fMultivar)


### Name: mvdist-msnFit
### Title: Multivariate Skew Normal Parameter Estimation
### Aliases: msnFit
### Keywords: math

### ** Examples

## Not run: 
##D ## Load Library:
##D    require(sn)
##D    
##D ## msnFit - 
##D    # Fit Example:
##D    N <- 1000
##D    xi <- c(0, 0) 
##D    Omega <- diag(2); Omega[2,1] <- Omega[1,2] <- 0.5
##D    alpha <- c(2, -6)
##D    set.seed(4711)
##D    X <- rmsn(n=N, xi, Omega, alpha)
##D    ans <- msnFit(X)
##D    print(ans)
##D 
##D    # 2-D Density Plot:
##D    plot(hexBinning(X[,1], X[, 2], bins = 30), main="Skew Normal")
##D    # Add Contours:
##D    N <- 101
##D    x <- seq(min(X[, 1]), max(X[, 1]), l=N)
##D    y <- seq(min(X[, 2]), max(X[, 2]), l=N)        
##D    u <- grid2d(x, y)$x
##D    v <- grid2d(x, y)$y
##D    XY <- cbind(u, v)
##D    param <- ans@fit$estimate
##D    Z <- matrix(dmsn(XY, param[[1]][1,], param[[2]], param[[3]]), ncol=N)
##D    contour(x, y, Z, add=TRUE, col="green", lwd=2)
##D    grid(col="brown", lty=3)
## End(Not run)



