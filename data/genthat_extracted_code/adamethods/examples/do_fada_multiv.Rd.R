library(adamethods)


### Name: do_fada_multiv
### Title: Run the whole archetypoid analysis with the functional
###   multivariate Frobenius norm
### Aliases: do_fada_multiv

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
##D set.seed(2018)
##D res_fada <- do_fada_multiv(subset = Xs, numArchoid = 3, numRep = 5, huge = 200, 
##D                            compare = FALSE, PM = PM, method = "adjbox")
##D str(res_fada)                             
## End(Not run)
                                  



