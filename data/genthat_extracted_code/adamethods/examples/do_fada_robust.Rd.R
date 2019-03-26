library(adamethods)


### Name: do_fada_robust
### Title: Run the whole archetypoid analysis with the functional robust
###   Frobenius norm
### Aliases: do_fada_robust

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
##D res_fada_rob <- do_fada_robust(subset = data_archs, numArchoid = 3, numRep = 5, huge = 200,
##D                                prob = 0.75, compare = FALSE, PM = PM, method = "adjbox")
##D str(res_fada_rob)  
##D 
##D set.seed(2018)
##D res_fada_rob1 <- do_fada_robust(subset = data_archs, numArchoid = 3, numRep = 5, huge = 200,
##D                                 prob = 0.75, compare = FALSE, PM = PM, 
##D                                 vect_tol = c(0.95, 0.9, 0.85), alpha = 0.05, 
##D                                 outl_degree = c("outl_strong", "outl_semi_strong", "outl_moderate"),
##D                                 method = "toler")
##D str(res_fada_rob1) 
## End(Not run)
                                  



