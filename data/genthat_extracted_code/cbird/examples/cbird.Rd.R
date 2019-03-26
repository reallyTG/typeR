library(cbird)


### Name: cbird
### Title: Clustering of multivariate binary data with dimension reduction
###   via L1-regularized likelihood maximization.
### Aliases: cbird

### ** Examples

##Random Binary Data (unmeaningful example)
##100 subjects and 20 variables
##Consider three mixture components in the data
set.seed(1)
Y <- matrix(rbinom(100 * 20, 1, 0.5), 100, 20)
out <- cbird(Y, 2, 3)

est <- EstScore(Y, out$A, out$mu)



