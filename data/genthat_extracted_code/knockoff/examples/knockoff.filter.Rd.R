library(knockoff)


### Name: knockoff.filter
### Title: The Knockoff Filter
### Aliases: knockoff.filter

### ** Examples

p=200; n=100; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

# Basic usage with default arguments
result = knockoff.filter(X, y)
print(result$selected)

# Advanced usage with custom arguments
knockoffs = function(X) create.gaussian(X, mu, Sigma)
k_stat = function(X, Xk, y) stat.glmnet_coefdiff(X, Xk, y, nfolds=5)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)





