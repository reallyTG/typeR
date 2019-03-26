library(RcppEnsmallen)


### Name: lin_reg_lbfgs
### Title: Linear Regression with L-BFGS
### Aliases: lin_reg_lbfgs

### ** Examples

# Number of Points
n = 1000

# Select beta parameters
beta = c(-2, 1.5, 3, 8.2, 6.6)

# Number of Predictors (including intercept)
p = length(beta)

# Generate predictors from a normal distribution
X_i = matrix(rnorm(n), ncol = p - 1)

# Add an intercept
X = cbind(1, X_i)

# Generate y values
y = X%*%beta + rnorm(n / (p - 1))

# Run optimization with lbfgs
theta_hat = lin_reg_lbfgs(X, y)

# Verify parameters were recovered
cbind(actual = beta, estimated = theta_hat)



