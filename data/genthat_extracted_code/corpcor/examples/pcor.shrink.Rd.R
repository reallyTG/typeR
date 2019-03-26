library(corpcor)


### Name: pcor.shrink
### Title: Shrinkage Estimates of Partial Correlation and Partial Variance
### Aliases: pcor.shrink pvar.shrink
### Keywords: multivariate

### ** Examples

# load corpcor library
library("corpcor")

# generate data matrix
p = 50
n = 10
X = matrix(rnorm(n*p), nrow = n, ncol = p)


# partial variance
pv = pvar.shrink(X)
pv

# partial correlations (fast and recommend way)
pcr1 = pcor.shrink(X)

# other possibilities to estimate partial correlations
pcr2 = cor2pcor( cor.shrink(X) )


# all the same
sum((pcr1 - pcr2)^2)




