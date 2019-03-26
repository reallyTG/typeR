library(adamethods)


### Name: stepArchetypesRawData_funct_robust
### Title: Archetype algorithm to raw data with the functional robust
###   Frobenius norm
### Aliases: stepArchetypesRawData_funct_robust

### ** Examples

## Not run: 
##D library(fda)
##D ?growth
##D str(growth)
##D hgtm <- t(growth$hgtm)
##D # Create basis:
##D basis_fd <- create.bspline.basis(c(1,ncol(hgtm)), 10)
##D PM <- eval.penalty(basis_fd)
##D # Make fd object:
##D temp_points <- 1:ncol(hgtm)
##D temp_fd <- Data2fd(argvals = temp_points, y = growth$hgtm, basisobj = basis_fd)
##D data_archs <- t(temp_fd$coefs)
##D 
##D lass <- stepArchetypesRawData_funct_robust(data = data_archs, numArch = 3, 
##D                                            numRep = 5, verbose = FALSE, 
##D                                            saveHistory = FALSE, PM, prob = 0.8)
##D str(lass)   
##D length(lass[[1]])
##D class(lass[[1]])  
##D class(lass[[1]][[5]]) 
## End(Not run)                                         




