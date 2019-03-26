library(knockoff)


### Name: stat.glmnet_lambdadiff
### Title: Importance statistics based on a GLM
### Aliases: stat.glmnet_lambdadiff

### ** Examples

p=200; n=100; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)
knockoffs = function(X) create.gaussian(X, mu, Sigma)

# Basic usage with default arguments
result = knockoff.filter(X, y, knockoffs=knockoffs, 
                           statistic=stat.glmnet_lambdadiff)
print(result$selected)

# Advanced usage with custom arguments
foo = stat.glmnet_lambdadiff
k_stat = function(X, X_k, y) foo(X, X_k, y, nlambda=200)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




