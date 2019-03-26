library(Rfolding)


### Name: pivot.approx
### Title: Computes the pivot s_2 (approximate pivot)
### Aliases: pivot.approx

### ** Examples

library(MASS)
mu = c(0,0)
Sigma = matrix(c(1,0.5,1,0.5), ncol = 2)
X = mvrnorm(n = 5000, mu = mu, Sigma = Sigma)
Phi = pivot.approx(X)




