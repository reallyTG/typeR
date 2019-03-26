library(knockoff)


### Name: create.fixed
### Title: Fixed-X knockoffs
### Aliases: create.fixed

### ** Examples

p=100; n=200; k=15
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 5.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

# Basic usage with default arguments
result = knockoff.filter(X, y, knockoffs=create.fixed)
print(result$selected)

# Advanced usage with custom arguments
knockoffs = function(X) create.fixed(X, method='equi')
result = knockoff.filter(X, y, knockoffs=knockoffs)
print(result$selected) 




