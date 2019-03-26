library(msir)


### Name: msir.permutation.test
### Title: Permutation test for dimensionality
### Aliases: msir.permutation.test
### Keywords: regression htest

### ** Examples

## Not run: 
##D # 1-dimensional simple regression
##D n <- 200
##D p <- 5
##D b <- as.matrix(c(1,-1,rep(0,p-2)))
##D x <- matrix(rnorm(n*p), nrow = n, ncol = p)
##D y <- exp(0.5 * x%*%b) + 0.1*rnorm(n)
##D MSIR <- msir(x, y)
##D msir.permutation.test(MSIR)
##D summary(MSIR)
## End(Not run)



