library(EDMeasure)


### Name: mdm_ica
### Title: Independent Component Analysis via Mutual Dependence Measures
### Aliases: mdm_ica

### ** Examples

# X is a 10 x 3 matrix with 10 samples and 3 components
X <- matrix(rnorm(10 * 3), 10, 3)

# deflation algorithm
mdm_ica(X, type = "asym", algo = "def")
# parallel algorithm
mdm_ica(X, type = "asym", algo = "par")

## Not run: 
##D # bayesian optimization with exponential kernel
##D mdm_ica(X, type = "sym", num_bo = 1, kernel = "exp", algo = "par")
##D # bayesian optimization with matern kernel
##D mdm_ica(X, type = "comp", num_bo = 1, kernel = "mat", algo = "par")
## End(Not run)



