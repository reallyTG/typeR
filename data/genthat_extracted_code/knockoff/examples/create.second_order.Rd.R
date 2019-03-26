library(knockoff)


### Name: create.second_order
### Title: Second-order Gaussian knockoffs
### Aliases: create.second_order

### ** Examples

p=200; n=100; k=15
rho = 0.4
Sigma = toeplitz(rho^(0:(p-1)))
X = matrix(rnorm(n*p),n) %*% chol(Sigma)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

# Basic usage with default arguments
result = knockoff.filter(X, y, knockoffs=create.second_order)
print(result$selected)

# Advanced usage with custom arguments
knockoffs = function(X) create.second_order(X, method='equi')
result = knockoff.filter(X, y, knockoffs=knockoffs)
print(result$selected)   
  



