library(MFKnockoffs)


### Name: MFKnockoffs.filter
### Title: Model-Free Knockoff Filter
### Aliases: MFKnockoffs.filter

### ** Examples

p=100; n=200; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

# Basic usage with default arguments
result = MFKnockoffs.filter(X, y)
print(result$selected)

# Advanced usage with custom arguments
knockoffs = function(X) MFKnockoffs.create.gaussian(X, mu, Sigma)
k_stat = function(X, X_k, y) MFKnockoffs.stat.glmnet_coef_difference(X, X_k, y, nfolds=5)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)





