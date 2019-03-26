library(Rfolding)


### Name: folding.test
### Title: Perform the folding test of unimodality
### Aliases: folding.test

### ** Examples

library(MASS)
n = 10000
d = 3
mu = c(0,0,0)
Sigma = matrix(c(1,0.5,0.5,0.5,1,0.5,0.5,0.5,1), ncol = d)
X = mvrnorm(n = n, mu = mu, Sigma = Sigma)
m = folding.test(X)




