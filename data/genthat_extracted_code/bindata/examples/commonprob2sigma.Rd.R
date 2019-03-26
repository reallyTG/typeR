library(bindata)


### Name: commonprob2sigma
### Title: Calculate a Covariance Matrix for the Normal Distribution from a
###   Matrix of Joint Probabilities
### Aliases: commonprob2sigma
### Keywords: distribution multivariate

### ** Examples

m <- cbind(c(1/2,1/5,1/6),c(1/5,1/2,1/6),c(1/6,1/6,1/2))
sigma <- commonprob2sigma(m)



