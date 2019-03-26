library(deconvolveR)


### Name: deconv
### Title: A function to compute Empirical Bayes estimates using
###   deconvolution
### Aliases: deconv

### ** Examples

set.seed(238923) ## for reproducibility
N <- 1000
theta <- rchisq(N,  df = 10)
X <- rpois(n = N, lambda = theta)
tau <- seq(1, 32)
result <- deconv(tau = tau, X = X, ignoreZero = FALSE)
print(result$stats)




