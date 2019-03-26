library(corpcor)


### Name: wt.scale
### Title: Weighted Expectations and Variances
### Aliases: wt.scale wt.var wt.moments
### Keywords: multivariate

### ** Examples

# load corpcor library
library("corpcor")

# generate some data
p = 5
n = 5
X = matrix(rnorm(n*p), nrow = n, ncol = p)
w = c(1,1,1,3,3)/9


# standardize matrix
scale(X)
wt.scale(X)
wt.scale(X, w) # take into account data weights




