library(logcondens)


### Name: logConCI
### Title: Compute pointwise confidence interval for a density assuming
###   log-concavity
### Aliases: logConCI
### Keywords: htest nonparametric

### ** Examples


## Not run: 
##D ## ===================================================
##D ## Confidence intervals at a fixed point for the density
##D ## ===================================================
##D data(reliability)
##D x.rel <- sort(reliability)
##D 
##D # calculate 95##D 
##D grid <- seq(min(x.rel), max(x.rel), length.out = 200)
##D res <- logConDens(x.rel)
##D ci  <- logConCI(res, grid, type = c("nrd", "ECDFboot"))	
##D 
##D par(las = 1, mar = c(2.5, 3.5, 0.5, 0.5))
##D hist(x.rel, n = 25, col = gray(0.9), main = "", freq = FALSE, 
##D     xlab = "", ylab = "", ylim = c(0, 0.0065), border = gray(0.5))
##D lines(grid, ci$fhat, col = "black", lwd = 2)
##D lines(grid, ci$lo_nrd, col = "red", lwd = 2, lty = 2)
##D lines(grid, ci$up_nrd, col = "red", lwd = 2, lty = 2)
##D lines(grid, ci$lo_ecdf, col = "blue", lwd = 2, lty = 2)
##D lines(grid, ci$up_ecdf, col = "blue", lwd = 2, lty = 2)
##D legend("topleft", col = c("black", "blue", "red"), lwd = 2, lty = c(1, 2, 2), legend = 
##D c("log-concave NPMLE", "CI for type = nrd", "CI for type = ECDFboot"), bty = "n")
## End(Not run)


