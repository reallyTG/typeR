library(MFKnockoffs)


### Name: MFKnockoffs.stat.forward_selection
### Title: Forward selection statistics for MFKnockoffs
### Aliases: MFKnockoffs.stat.forward_selection

### ** Examples

p=100; n=200; k=15
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)
nonzero = sample(p, k)
beta = 3.5 * (1:p %in% nonzero)
y = X %*% beta + rnorm(n)

# Basic usage with default arguments
knockoffs = function(X) MFKnockoffs.create.gaussian(X, mu, Sigma)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs,
                           statistic=MFKnockoffs.stat.forward_selection)
print(result$selected)

# Advanced usage with custom arguments
foo = MFKnockoffs.stat.forward_selection
k_stat = function(X, X_k, y) foo(X, X_k, y, omp=TRUE)
result = MFKnockoffs.filter(X, y, knockoffs=knockoffs, statistic=k_stat)
print(result$selected)




