library(adamethods)


### Name: do_fada
### Title: Run the whole functional archetypoid analysis with the Frobenius
###   norm
### Aliases: do_fada

### ** Examples

## Not run: 
##D library(fda)
##D ?growth
##D str(growth)
##D hgtm <- t(growth$hgtm)
##D 
##D # Create basis:
##D basis_fd <- create.bspline.basis(c(1,ncol(hgtm)), 10)
##D PM <- eval.penalty(basis_fd)
##D # Make fd object:
##D temp_points <- 1:ncol(hgtm)
##D temp_fd <- Data2fd(argvals = temp_points, y = growth$hgtm, basisobj = basis_fd)
##D data_archs <- t(temp_fd$coefs)
##D 
##D set.seed(2018)
##D res_fada <- do_fada(subset = data_archs, numArchoid = 3, numRep = 5, huge = 200, 
##D                     compare = FALSE, PM = PM, method = "adjbox")
##D str(res_fada)      
##D 
##D set.seed(2018)
##D res_fada1 <- do_fada(subset = data_archs, numArchoid = 3, numRep = 5, huge = 200, 
##D                      compare = FALSE, PM = PM, 
##D                      vect_tol = c(0.95, 0.9, 0.85), alpha = 0.05, 
##D                      outl_degree = c("outl_strong", "outl_semi_strong", "outl_moderate"),
##D                      method = "toler")
##D str(res_fada1)                               
## End(Not run)
                                  



