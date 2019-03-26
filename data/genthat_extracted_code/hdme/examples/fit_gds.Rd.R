library(hdme)


### Name: fit_gds
### Title: Generalized Dantzig Selector
### Aliases: fit_gds

### ** Examples

# Example with logistic regression
n <- 1000  # Number of samples
p <- 10 # Number of covariates
X <- matrix(rnorm(n * p), nrow = n) # True (latent) variables # Design matrix
beta <- c(seq(from = 0.1, to = 1, length.out = 5), rep(0, p-5)) # True regression coefficients
y <- rbinom(n, 1, (1 + exp(-X %*% beta))^(-1)) # Binomially distributed response
gds <- fit_gds(X, y, family = "binomial")




