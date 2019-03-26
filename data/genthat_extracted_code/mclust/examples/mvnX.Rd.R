library(mclust)


### Name: mvnX
### Title: Univariate or Multivariate Normal Fit
### Aliases: mvnX mvnXII mvnXXI mvnXXX
### Keywords: cluster

### ** Examples

## Not run: 
##D n <- 1000
##D 
##D set.seed(0)
##D x <- rnorm(n, mean = -1, sd = 2)
##D mvnX(x) 
##D 
##D mu <- c(-1, 0, 1)
##D 
##D set.seed(0)
##D x <- sweep(matrix(rnorm(n*3), n, 3) %*% (2*diag(3)), 
##D            MARGIN = 2, STATS = mu, FUN = "+")
##D mvnXII(x) 
##D 
##D set.seed(0)
##D x <- sweep(matrix(rnorm(n*3), n, 3) %*% diag(1:3), 
##D            MARGIN = 2, STATS = mu, FUN = "+")
##D mvnXXI(x)
##D 
##D Sigma <- matrix(c(9,-4,1,-4,9,4,1,4,9), 3, 3)
##D set.seed(0)
##D x <- sweep(matrix(rnorm(n*3), n, 3) %*% chol(Sigma), 
##D            MARGIN = 2, STATS = mu, FUN = "+")
##D mvnXXX(x) 
## End(Not run)



