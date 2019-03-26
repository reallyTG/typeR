library(corpcor)


### Name: rebuild.cov
### Title: Rebuild and Decompose the (Inverse) Covariance Matrix
### Aliases: rebuild.cov rebuild.invcov decompose.cov decompose.invcov
### Keywords: multivariate

### ** Examples

# load corpcor library
library("corpcor")

# a correlation matrix and some variances
r = matrix(c(1, 1/2, 1/2, 1),  nrow = 2, ncol=2)
r
v = c(2, 3)

# construct the associated covariance matrix
c = rebuild.cov(r, v)
c

# decompose into correlations and variances
decompose.cov(c)


# the corresponding concentration matrix
conc = pseudoinverse(c) 
conc

# decompose into partial correlation matrix and partial variances
tmp = decompose.invcov(conc)
tmp
# note: because this is an example with two variables,
# the partial and standard correlations are identical!


# reconstruct the concentration matrix from partial correlations and
# partial variances 
rebuild.invcov(tmp$pr, tmp$pv)




