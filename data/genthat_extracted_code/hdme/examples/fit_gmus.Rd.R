library(hdme)


### Name: fit_gmus
### Title: Generalized Matrix Uncertainty Selector
### Aliases: fit_gmus

### ** Examples

# Example with linear regression
set.seed(1)
n <- 100 # Number of samples
p <- 50 # Number of covariates
# True (latent) variables
X <- matrix(rnorm(n * p), nrow = n)
# Measurement matrix (this is the one we observe)
W <- X + matrix(rnorm(n*p, sd = 1), nrow = n, ncol = p)
# Coefficient vector
beta <- c(seq(from = 0.1, to = 1, length.out = 5), rep(0, p-5))
# Response
y <- X %*% beta + rnorm(n, sd = 1)
# Run the MU Selector
gmus1 <- fit_gmus(W, y)
# Draw an elbow plot to select delta
plot(gmus1)

# Now, according to the "elbow rule", choose
# the final delta where the curve has an "elbow".
# In this case, the elbow is at about delta = 0.08,
# so we use this to compute the final estimate:
gmus2 <- fit_gmus(W, y, delta = 0.08)
# Plot the coefficients
plot(gmus2)




