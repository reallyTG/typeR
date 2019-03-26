library(adamethods)


### Name: archetypoids_funct_multiv
### Title: Archetypoid algorithm with the functional multivariate Frobenius
###   norm
### Aliases: archetypoids_funct_multiv

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
##D lass <- stepArchetypesRawData_funct_multiv(data = Xs, numArch = 3, 
##D                                            numRep = 5, verbose = FALSE, 
##D                                            saveHistory = FALSE, PM)
##D                                            
##D afm <- archetypoids_funct_multiv(3, Xs, huge = 200, ArchObj = lass, PM)
##D str(afm)
## End(Not run)                                                          
                                                     



