library(MFKnockoffs)


### Name: MFKnockoffs.stat.sqrt_lasso
### Title: SQRT-lasso statistics for Knockoff
### Aliases: MFKnockoffs.stat.sqrt_lasso

### ** Examples

p=50; n=50; k=10
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

knockoffs = function(X) MFKnockoffs.create.gaussian(X, mu, Sigma)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs, statistic=MFKnockoffs.stat.sqrt_lasso)
print(result$selected)

# Advanced usage with custom arguments
foo = MFKnockoffs.stat.sqrt_lasso
k_stat = function(X, X_k, y) foo(X, X_k, y, q=0.5)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




