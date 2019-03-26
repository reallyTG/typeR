library(synlik)


### Name: extractCorr
### Title: Extracting correlations from a covariance matrix
### Aliases: extractCorr

### ** Examples

# 2 dimensional case
d <- 2
tmp <- matrix(rnorm(d^2), d, d)
mcov <- tcrossprod(tmp, tmp)

# Covariance matrix
mcov

# Correlation matrix
extractCorr(mcov)



