library(Rfolding)


### Name: folding.test.pvalue
### Title: Computes the p-value of the folding test
### Aliases: folding.test.pvalue

### ** Examples

library(MASS)
n = 5000
d = 2
mu = c(0,0)
Sigma = matrix(c(1,0.5,1,0.5), ncol = d)
X = mvrnorm(n = n, mu = mu, Sigma = Sigma)
Phi = folding.statistics(X)
p = folding.test.pvalue(Phi,n,d)




