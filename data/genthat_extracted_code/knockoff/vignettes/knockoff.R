## ----set-seed, results='hide', warning=FALSE-----------------------------
set.seed(1234)

## ----define-problem------------------------------------------------------
# Problem parameters
n = 1000          # number of observations
p = 1000          # number of variables
k = 60            # number of variables with nonzero coefficients
amplitude = 4.5   # signal amplitude (for noise level = 1)

# Generate the variables from a multivariate normal distribution
mu = rep(0,p)
rho = 0.25
Sigma = toeplitz(rho^(0:(p-1)))
X = matrix(rnorm(n*p),n) %*% chol(Sigma)

# Generate the response from a linear model
nonzero = sample(p, k)
beta = amplitude * (1:p %in% nonzero) / sqrt(n)
y.sample = function(X) X %*% beta + rnorm(n)
y = y.sample(X)

## ----knock-default, results='hide', message=F, warning=F-----------------
library(knockoff)
result = knockoff.filter(X, y)

## ----print-result--------------------------------------------------------
print(result)

## ----define-fdp----------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(result$selected)

## ----knock-gaussian------------------------------------------------------
gaussian_knockoffs = function(X) create.gaussian(X, mu, Sigma)
result = knockoff.filter(X, y, knockoffs=gaussian_knockoffs)
print(result)

## ----print-fdp-----------------------------------------------------------
fdp(result$selected)

## ----knock-RF------------------------------------------------------------
result = knockoff.filter(X, y, knockoffs = gaussian_knockoffs, statistic = stat.random_forest, fdr=0.2)
print(result)
fdp(result$selected)

## ----custom-stat, warning=FALSE------------------------------------------
my_knockoff_stat = function(X, X_k, y) {
  abs(t(X) %*% y) - abs(t(X_k) %*% y)
}
result = knockoff.filter(X, y, knockoffs = gaussian_knockoffs, statistic = my_knockoff_stat)
print(result)
fdp(result$selected)

## ----lasso-stat, warning=FALSE-------------------------------------------
my_lasso_stat = function(...) stat.glmnet_coefdiff(..., nlambda=100)
result = knockoff.filter(X, y, knockoffs = gaussian_knockoffs, statistic = my_lasso_stat)
print(result)
fdp(result$selected)

## ----custom-knock--------------------------------------------------------
create_knockoffs = function(X) {
  create.second_order(X, shrink=T)
}
result = knockoff.filter(X, y, knockoffs=create_knockoffs)
print(result)
fdp(result$selected)

## ----knock-second-order--------------------------------------------------
gaussian_knockoffs = function(X) create.second_order(X, method='sdp', shrink=T)
result = knockoff.filter(X, y, knockoffs = gaussian_knockoffs)
print(result)
fdp(result$selected)

## ----knock-equi----------------------------------------------------------
gaussian_knockoffs = function(X) create.second_order(X, method='equi', shrink=T)
result = knockoff.filter(X, y, knockoffs = gaussian_knockoffs)
print(result)
fdp(result$selected)

