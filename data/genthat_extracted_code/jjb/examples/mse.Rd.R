library(jjb)


### Name: mse
### Title: Mean Squared Error (MSE)
### Aliases: mse

### ** Examples

# Set seed for reproducibility
set.seed(100)

# Generate data
n = 1e2

y = rnorm(n)
yhat = rnorm(n, 0.5)

# Compute
o = mse(y, yhat)



