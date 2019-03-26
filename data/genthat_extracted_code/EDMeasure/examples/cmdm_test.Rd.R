library(EDMeasure)


### Name: cmdm_test
### Title: Conditional Mean Independence Tests
### Aliases: cmdm_test

### ** Examples

## Not run: 
##D # X, Y, Z are vectors with 10 samples and 1 variable
##D X <- rnorm(10)
##D Y <- rnorm(10)
##D Z <- rnorm(10)
##D 
##D cmdm_test(X, Y, Z, type = "linmdd")
##D 
##D # X, Y, Z are 10 x 2 matrices with 10 samples and 2 variables
##D X <- matrix(rnorm(10 * 2), 10, 2)
##D Y <- matrix(rnorm(10 * 2), 10, 2)
##D Z <- matrix(rnorm(10 * 2), 10, 2)
##D 
##D cmdm_test(X, Y, Z, type = "pmdd")
## End(Not run)



