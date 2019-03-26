library(MFKnockoffs)


### Name: MFKnockoffs.stat.stability_selection
### Title: Stability selection statistics for MFKnockoffs
### Aliases: MFKnockoffs.stat.stability_selection

### ** Examples

p=100; n=200; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

knockoffs = function(X) MFKnockoffs.create.gaussian(X, mu, Sigma)
# Basic usage with default arguments
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs,
                           statistic=MFKnockoffs.stat.stability_selection)
print(result$selected)

# Advanced usage with custom arguments
foo = MFKnockoffs.stat.stability_selection
k_stat = function(X, X_k, y) foo(X, X_k, y, fitfun=stabs::lars.lasso)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




