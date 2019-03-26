library(adamethods)


### Name: archetypoids_funct
### Title: Archetypoid algorithm with the functional Frobenius norm
### Aliases: archetypoids_funct

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
##D lass <- stepArchetypesRawData_funct(data = data_archs, numArch = 3, 
##D                                     numRep = 5, verbose = FALSE, 
##D                                     saveHistory = FALSE, PM)
##D 
##D af <- archetypoids_funct(3, data_archs, huge = 200, ArchObj = lass, PM) 
##D str(af)                                
## End(Not run)                                                          
                                                     



