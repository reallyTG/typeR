library(OjaNP)


### Name: ojaSign
### Title: Oja Signs - Affine Equivariant Multivariate Signs
### Aliases: ojaSign
### Keywords: multivariate nonparametric

### ** Examples

### ----<< Example 1 >>---- : 30 points in R^2
set.seed(123)
X <- rmvnorm(n = 30, mean = c(0,0)) # from package 'mvtnorm'
y <- c(100,100)
om <- ojaMedian(X, alg = "exact")

ojaSign(X)
ojaSign(X,y)
# possible ways of specifying the mean as location:
ojaSign(X, center = "colMean")
ojaSign(X, center = colMeans)
ojaSign(X, center = colMeans(X))

# The following two return the same (only in different time),
ojaSign(X, center = colMeans)
t(apply(X, 1, function(y){ojaSign(X, y, center = colMeans)}))

# but the following not (due to different subsampling).
# 1)
set.seed(123)
ojaSign(X, center = colMeans, p = 0.9, silent = TRUE)
# 2)
set.seed(123)
t(apply(X, 1, function(y){ojaSign(X, y, c = colMeans,p = 0.9, s = TRUE)}))
# In 1) one subsample for all signs is drawn, whereas in 2)
# a different sample for each sign is drawn.

### ----<< Example 2 >>---- : Oja median
# The Oja sign of the Oja median is zero:
ojaSign(X, x = om, alg = "exact") 
# The default location function 'ojaMedian()' 
# is called with method "exact",
# which gives the same result as:
ojaSign(X, x = om, center = om) 
# But note: The following is likely to not return zero.  
ojaSign(X, x = ojaMedian(X))
# The default method of 'ojaMedian()' is "evo", 
# which is fast, but returns approximate results.



### ----<< Example 3 >>---- : 400 points in R^6
# Subsampling is done.
# The following example might take a bit longer:
## Not run: 
##D set.seed(123)
##D X <- rmvnorm(n = 400, mean = rep(0, 6))
##D os1 <- ojaSign(X, x = 1:6, c = colMeans)
##D # Note: the following command may take several minutes
##D os2 <- ojaSign(X, x = 1:6, p = 0.0000001, c = colMeans)
## End(Not run)



