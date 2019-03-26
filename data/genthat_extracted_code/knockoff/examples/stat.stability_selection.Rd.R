library(knockoff)


### Name: stat.stability_selection
### Title: Importance statistics based on stability selection
### Aliases: stat.stability_selection

### ** Examples

p=100; n=100; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)
knockoffs = function(X) create.gaussian(X, mu, Sigma)

# Basic usage with default arguments
result = knockoff.filter(X, y, knockoffs=knockoffs,
                           statistic=stat.stability_selection)
print(result$selected)

# Advanced usage with custom arguments
foo = stat.stability_selection
k_stat = function(X, X_k, y) foo(X, X_k, y, fitfun=stabs::lars.lasso)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




