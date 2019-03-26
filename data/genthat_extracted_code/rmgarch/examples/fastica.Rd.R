library(rmgarch)


### Name: fastica
### Title: Fast Fixed Point ICA
### Aliases: fastica
### Keywords: multivariate

### ** Examples

## Not run: 
##D # create a set of independent signals S, glued together by a mixing matrix A
##D # (note the notation and matrix multiplication direction as we are dealing with
##D # row rather than column vectors)
##D set.seed(100)
##D S <- matrix(runif(10000), 5000, 2)
##D A <- matrix(c(1, 1, -1, 2), 2, 2, byrow = TRUE)
##D # the mixed signal X
##D X = S %*% t(A)
##D # The function centers and whitens (by the eigenvalue decomposition of the 
##D # unconditional covariance matrix)  the data before applying the theICA algorithm.
##D IC <- fastica(X, n.comp = 2, approach = "symmetric", gfun = "tanh", trace  = TRUE, 
##D A.init = diag(2))
##D 
##D # demeaned data:
##D X_bar = scale(X, scale = FALSE)
##D 
##D # whitened data:
##D X_white = X_bar %*% t(IC$whiteningMatrix)
##D 
##D # check whitening:
##D # check correlations are zero
##D cor(X_white)
##D # check diagonals are 1 in covariance
##D cov(X_white)
##D 
##D # check that the estimated signals(S) multiplied by the
##D # estimated mxing matrix (A) are the same as the original dataset (X)
##D round(head(IC$S %*% t(IC$A)), 12) == round(head(X), 12)
##D 
##D # do some plots:
##D par(mfrow = c(1, 3))
##D plot(IC$S %*% t(IC$A), main = "Pre-processed data")
##D plot(X_white, main = "Whitened and Centered components")
##D plot(IC$S, main = "ICA components")
## End(Not run)


