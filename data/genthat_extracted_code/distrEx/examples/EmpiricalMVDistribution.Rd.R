library(distrEx)


### Name: EmpiricalMVDistribution
### Title: Generating function for mulitvariate discrete distribution
### Aliases: EmpiricalMVDistribution
### Keywords: distribution

### ** Examples

## generate some data
X <- matrix(rnorm(50), ncol = 5)

## empirical distribution of X
D1 <- EmpiricalMVDistribution(data = X)
support(D1)
r(D1)(10)



