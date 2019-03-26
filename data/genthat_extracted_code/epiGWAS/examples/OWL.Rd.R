library(epiGWAS)


### Name: OWL
### Title: Implements the outcome weighted learning approach
### Aliases: OWL

### ** Examples

n <- 30
p <- 10
X <- matrix((runif(n * p) < 0.5) + (runif(n * p) < 0.5), ncol = p, nrow = n)
A <- (runif(n, min = 0, max = 1) < 0.3)
propensity <- runif(n, min = 0.4, max = 0.8)
Y <- runif(n, min = 0, max = 1) < 1/ (1 + exp(-X[, c(1, 7)] %*% rnorm(2)))
OWL(A, X, Y, propensity, short = FALSE, n_lambda = 50, n_subsample = 1)




