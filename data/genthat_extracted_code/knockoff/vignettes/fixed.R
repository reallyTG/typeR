## ---- results='hide', message=FALSE, warning=FALSE-----------------------
set.seed(1234)

## ------------------------------------------------------------------------
# Problem parameters
n = 1000          # number of observations
p = 300           # number of variables
k = 30            # number of variables with nonzero coefficients
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

## ---- results='hide', message=FALSE--------------------------------------
library(knockoff)
result = knockoff.filter(X, y, knockoffs = create.fixed, statistic = stat.glmnet_lambdasmax)

## ------------------------------------------------------------------------
print(result)

## ------------------------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(result$selected)

