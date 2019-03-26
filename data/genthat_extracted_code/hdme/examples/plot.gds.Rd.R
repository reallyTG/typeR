library(hdme)


### Name: plot.gds
### Title: Plot the estimates returned by fit_gds
### Aliases: plot.gds

### ** Examples

set.seed(1)
# Example with logistic regression
# Number of samples
n <- 1000
# Number of covariates
p <- 10
# True (latent) variables (Design matrix)
X <- matrix(rnorm(n * p), nrow = n)
# True regression coefficients
beta <- c(seq(from = 0.1, to = 1, length.out = 5), rep(0, p-5))
# Binomially distributed response
y <- rbinom(n, 1, (1 + exp(-X %*% beta))^(-1))
# Fit the generalized Dantzig Selector
gds <- fit_gds(X, y, family = "binomial")
# Plot the estimated coefficients at the chosen lambda
plot(gds)




