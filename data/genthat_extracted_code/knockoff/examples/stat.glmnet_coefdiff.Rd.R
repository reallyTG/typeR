library(knockoff)


### Name: stat.glmnet_coefdiff
### Title: Importance statistics based on a GLM with cross-validation
### Aliases: stat.glmnet_coefdiff

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
                           statistic=stat.glmnet_coefdiff)
print(result$selected)

# Advanced usage with custom arguments
foo = stat.glmnet_coefdiff
k_stat = function(X, X_k, y) foo(X, X_k, y, nlambda=200)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




