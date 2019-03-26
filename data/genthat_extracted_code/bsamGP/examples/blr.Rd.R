library(bsamGP)


### Name: blr
### Title: Bayesian Linear Regression
### Aliases: blr
### Keywords: linear regression model parametric model

### ** Examples

#####################
# Simulated example #
#####################

# Simulate data
set.seed(1)

n <- 100
w <- runif(n)
y <- 3 + 2*w + rnorm(n, sd = 0.8)

# Fit the model with default priors and mcmc parameters
fout <- blr(y ~ w)

# Summary
print(fout); summary(fout)

# Fitted values
fit <- fitted(fout)

# Plots
plot(fout)



