library(MFKnockoffs)


### Name: MFKnockoffs.stat.lasso_lambda_signed_max_bin
### Title: Penalized logistic regression statistics for MFKnockoffs
### Aliases: MFKnockoffs.stat.lasso_lambda_signed_max_bin

### ** Examples

p=100; n=200; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
pr = 1/(1+exp(-X %*% beta))
y = rbinom(n,1,pr)

knockoffs = function(X) MFKnockoffs.create.gaussian(X, mu, Sigma)
# Basic usage with default arguments
result = MFKnockoffs.filter(X, y, knockoff=knockoffs,
                           statistic=MFKnockoffs.stat.lasso_lambda_signed_max_bin)
print(result$selected)

# Advanced usage with custom arguments
foo = MFKnockoffs.stat.lasso_lambda_signed_max_bin
k_stat = function(X, X_k, y) foo(X, X_k, y, nlambda=200)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




