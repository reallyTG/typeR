library(knockoff)


### Name: stat.lasso_lambdadiff_bin
### Title: Importance statistics based on regularized logistic regression
### Aliases: stat.lasso_lambdadiff_bin

### ** Examples

p=200; n=100; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
pr = 1/(1+exp(-X %*% beta))
y = rbinom(n,1,pr)
knockoffs = function(X) create.gaussian(X, mu, Sigma)

# Basic usage with default arguments
result = knockoff.filter(X, y, knockoffs=knockoffs, 
                           statistic=stat.lasso_lambdadiff_bin)
print(result$selected)

# Advanced usage with custom arguments
foo = stat.lasso_lambdadiff_bin
k_stat = function(X, X_k, y) foo(X, X_k, y, nlambda=200)
result = knockoff.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




