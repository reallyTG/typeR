library(EDMeasure)


### Name: mdm_test
### Title: Mutual Independence Tests
### Aliases: mdm_test

### ** Examples

## Not run: 
##D # X is a 10 x 3 matrix with 10 samples and 3 variables
##D X <- matrix(rnorm(10 * 3), 10, 3)
##D 
##D # assume X = (X1, X2) where X1 is 1-dim, X2 is 2-dim
##D mdm_test(X, dim_comp = c(1, 2), type = "asym_dcov")
##D 
##D # assume X = (X1, X2) where X1 is 2-dim, X2 is 1-dim
##D mdm_test(X, dim_comp = c(2, 1), type = "sym_dcov")
##D 
##D # assume X = (X1, X2, X3) where X1 is 1-dim, X2 is 1-dim, X3 is 1-dim
##D mdm_test(X, dim_comp = c(1, 1, 1), type = "comp_simp")
## End(Not run)



