library(OjaNP)


### Name: ojaRank
### Title: Oja Ranks - Affine Equivariant Multivariate Ranks
### Aliases: ojaRank
### Keywords: multivariate nonparametric

### ** Examples

### ----<< Example 1 >>---- : 30 points in R^2
## Not run: 
##D set.seed(123)
##D X <- rmvnorm(n = 30,mean = c(0,0)) # from package 'mvtnorm'
##D ojaRank(X)
##D ojaRank(X, x = c(100,100))
##D ojaRank(X, x = ojaMedian(X, alg="exact")) # close to zero
##D 
##D # The following two return the same (only in different time)
##D ojaRank(X)
##D t(apply(X, 1, function(y){ojaRank(X,y)}))
##D # but the following two do not (due to different subsampling).
##D # 1)
##D set.seed(123); ojaRank(X, p = 0.9, silent = TRUE)
##D # 2)
##D set.seed(123) 
##D t(apply(X, 1, function(y){ojaRank(X, y, p = 0.9, silent = TRUE)}))
##D # In 1) one subsample for all ranks is drawn, whereas in 2)
##D # a different sample for each rank is drawn.
## End(Not run)

### ----<< Example 2 >>---- : three points in R^3: only one hyperplane
# The following commands return the same result.
## Not run: 
##D ojaRank(X = diag(rep(1, 3)), x = c(0,0,0))
##D ojaRank(X = diag(rep(1, 3)), x = c(-100,-110,-5550))
##D hyperplane(X = diag(rep(1,3)))[1:3]
## End(Not run)


### ----<< Example 3 >>---- : 300 points in R^7
# Subsampling is done.
# The following example might take a bit longer:
## Not run: 
##D set.seed(123)
##D X <- rmvnorm(n = 300, mean = rep(0, 7))
##D system.time(or <- ojaRank(x = 1:7, X = X))
##D # PLEASE NOTE: The computation of the Oja rank is based on a 
##D # random sub-sample of less than 1% of all possible hyperplanes.
##D #
##D #       user      system     elapsed 
##D #      18.47        0.00       18.47 
##D print(or,d=4)
##D # [1]  7.733  6.613  6.839  7.383 18.237 21.851 23.700
## End(Not run)


### ----<< Example 4 >>---- : univariate ranks
## Not run: 
##D ojaRank(1:10)
##D ojaRank(X = 1:10, x = 5.5)
## End(Not run)



