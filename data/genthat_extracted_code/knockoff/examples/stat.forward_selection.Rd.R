library(knockoff)


### Name: stat.forward_selection
### Title: Importance statistics based on forward selection
### Aliases: stat.forward_selection

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
                           statistic=stat.forward_selection)
print(result$selected)

# Advanced usage with custom arguments
foo = stat.forward_selection
k_stat = function(X, X_k, y) foo(X, X_k, y, omp=TRUE)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




