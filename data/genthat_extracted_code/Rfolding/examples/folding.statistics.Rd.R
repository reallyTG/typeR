library(Rfolding)


### Name: folding.statistics
### Title: Computes the folding statistics of the input data
### Aliases: folding.statistics

### ** Examples

library(MASS)
mu = c(0,0)
Sigma = matrix(c(1,0.5,1,0.5), ncol = 2)
X = mvrnorm(n = 5000, mu = mu, Sigma = Sigma)
Phi = folding.statistics(X)




