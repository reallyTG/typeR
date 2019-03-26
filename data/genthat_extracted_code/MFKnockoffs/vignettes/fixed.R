## ---- results='hide', message=FALSE, warning=FALSE-----------------------
set.seed(1234)

## ------------------------------------------------------------------------
# Problem parameters
n = 1000          # number of observations
p = 300           # number of variables
k = 30            # number of variables with nonzero coefficients
amplitude = 4.5   # signal amplitude (for noise level = 1)

# Generate the variables from a multivariate normal distribution
mu = rep(0,p); Sigma = diag(p)
X = matrix(rnorm(n*p),n)

# Generate the response from a linear model
nonzero = sample(p, k)
beta = amplitude * (1:p %in% nonzero) / sqrt(n)
y.sample = function(X) X %*% beta + rnorm(n)
y = y.sample(X)

## ---- results='hide', message=FALSE--------------------------------------
library(MFKnockoffs)
result = MFKnockoffs.filter(X, y, knockoffs = MFKnockoffs.create.fixed, statistic = MFKnockoffs.stat.glmnet_lambda_difference)

## ------------------------------------------------------------------------
print(result)

## ------------------------------------------------------------------------
fdp = function(selected) sum(beta[selected] == 0) / max(1, length(selected))
fdp(result$selected)

