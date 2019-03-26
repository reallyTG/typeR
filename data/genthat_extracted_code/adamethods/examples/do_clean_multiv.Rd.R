library(adamethods)


### Name: do_clean_multiv
### Title: Cleaning multivariate functional outliers
### Aliases: do_clean_multiv

### ** Examples

## Not run: 
##D library(fda)
##D ?growth
##D str(growth)
##D hgtm <- growth$hgtm
##D hgtf <- growth$hgtf[,1:39]
##D 
##D # Create array:
##D nvars <- 2
##D data.array <- array(0, dim = c(dim(hgtm), nvars))
##D data.array[,,1] <- as.matrix(hgtm)
##D data.array[,,2] <- as.matrix(hgtf)
##D rownames(data.array) <- 1:nrow(hgtm)
##D colnames(data.array) <- colnames(hgtm)
##D str(data.array)
##D 
##D # Create basis:
##D nbasis <- 10
##D basis_fd <- create.bspline.basis(c(1,nrow(hgtm)), nbasis)
##D PM <- eval.penalty(basis_fd)
##D # Make fd object:
##D temp_points <- 1:nrow(hgtm)
##D temp_fd <- Data2fd(argvals = temp_points, y = data.array, basisobj = basis_fd)
##D 
##D X <- array(0, dim = c(dim(t(temp_fd$coefs[,,1])), nvars))
##D X[,,1] <- t(temp_fd$coef[,,1]) 
##D X[,,2] <- t(temp_fd$coef[,,2])
##D 
##D # Standardize the variables:
##D Xs <- X
##D Xs[,,1] <- scale(X[,,1])
##D Xs[,,2] <- scale(X[,,2])
##D 
##D x1 <- t(Xs[,,1]) 
##D for (i in 2:nvars) { 
##D  x12 <- t(Xs[,,i]) 
##D  x1 <- rbind(x1, x12) 
##D }
##D data_all <- t(x1) 
##D 
##D num_pts <- ncol(data_all) / nvars
##D range <- 3 
##D outl <- do_clean_multiv(t(data_all), num_pts, range, out_perc, nbasis, nvars)
##D outl
## End(Not run)
                  



