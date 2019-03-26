## ---- results='hide', warning=FALSE--------------------------------------
set.seed(1234)

## ------------------------------------------------------------------------
# Problem parameters
n = 1000          # number of observations
p = 1000          # number of variables
k = 60            # number of variables with nonzero coefficients
amplitude = 4.5   # signal amplitude (for noise level = 1)

# Generate the variables from a multivariate normal distribution
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)

# Generate the response from a linear model
nonzero = sample(p, k)
beta = amplitude * (1:p %in% nonzero) / sqrt(n)
y.sample = function(X) X %*% beta + rnorm(n)
y = y.sample(X)

## ---- results='hide', message=F, warning=F-------------------------------
library(MFKnockoffs)
result = MFKnockoffs.filter(X, y)

## ------------------------------------------------------------------------
print(result)

## ------------------------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(result$selected)

## ------------------------------------------------------------------------
gaussian_knockoffs = function(X) MFKnockoffs.create.gaussian(X, mu, Sigma)
result = MFKnockoffs.filter(X, y, knockoffs=gaussian_knockoffs)
print(result)

## ------------------------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(result$selected)

## ------------------------------------------------------------------------
result = MFKnockoffs.filter(X, y, knockoffs = gaussian_knockoffs, statistic = MFKnockoffs.stat.random_forest, q=0.2)
print(result)
fdp(result$selected)

## ---- warning=FALSE------------------------------------------------------
my_knockoff_stat = function(X, X_k, y) {
  abs(t(X) %*% y) - abs(t(X_k) %*% y)
}
result = MFKnockoffs.filter(X, y, knockoffs = gaussian_knockoffs, statistic = my_knockoff_stat)
print(result)
fdp(result$selected)

## ---- warning=FALSE------------------------------------------------------
my_lasso_stat = function(...) MFKnockoffs.stat.glmnet_coef_difference(..., nlambda=100)
result = MFKnockoffs.filter(X, y, knockoffs = gaussian_knockoffs, statistic = my_lasso_stat)
print(result)
fdp(result$selected)

## ------------------------------------------------------------------------
create_knockoffs = function(X) {
  MFKnockoffs.create.approximate_gaussian(X, shrink=T)
}
result = MFKnockoffs.filter(X, y, knockoffs=create_knockoffs)
print(result)
fdp(result$selected)

## ------------------------------------------------------------------------
gaussian_knockoffs = function(X) MFKnockoffs.create.approximate_gaussian(X, method='sdp', shrink=T)
result = MFKnockoffs.filter(X, y, knockoffs = gaussian_knockoffs)
print(result)
fdp(result$selected)

## ------------------------------------------------------------------------
gaussian_knockoffs = function(X) MFKnockoffs.create.approximate_gaussian(X, method='equi', shrink=T)
result = MFKnockoffs.filter(X, y, knockoffs = gaussian_knockoffs)
print(result)
fdp(result$selected)

