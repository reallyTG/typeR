library(knockoff)


### Name: stat.sqrt_lasso
### Title: Importance statistics based on the square-root lasso
### Aliases: stat.sqrt_lasso

### ** Examples

p=50; n=50; k=10
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)
knockoffs = function(X) create.gaussian(X, mu, Sigma)

# Basic usage with default arguments
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=stat.sqrt_lasso)
print(result$selected)

# Advanced usage with custom arguments
foo = stat.sqrt_lasso
k_stat = function(X, X_k, y) foo(X, X_k, y, q=0.5)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




