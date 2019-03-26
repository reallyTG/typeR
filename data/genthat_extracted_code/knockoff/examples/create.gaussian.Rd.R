library(knockoff)


### Name: create.gaussian
### Title: Model-X Gaussian knockoffs
### Aliases: create.gaussian

### ** Examples

p=200; n=100; k=15
rho = 0.4
mu = rep(0,p); Sigma = toeplitz(rho^(0:(p-1)))
X = matrix(rnorm(n*p),n) %*% chol(Sigma)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

# Basic usage with default arguments
knockoffs = function(X) create.gaussian(X, mu, Sigma)
result = knockoff.filter(X, y, knockoffs=knockoffs)
print(result$selected)

# Advanced usage with custom arguments
knockoffs = function(X) create.gaussian(X, mu, Sigma, method='equi')
result = knockoff.filter(X, y, knockoffs=knockoffs)
print(result$selected)




