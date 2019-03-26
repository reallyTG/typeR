library(severity)


### Name: severity-package
### Title: Mayo's Post-data Severity Evaluation
### Aliases: severity-package
### Keywords: package htest

### ** Examples

library(severity)
mu0 <- 5
sigma <- 2
n <- 100
alpha <- 0.025
xbar <- c(5.39, 5.30, 5.10, 5.40, 5.60, 5.85)
(sev <- severity(mu0 = mu0, xbar = xbar, sigma = sigma, n = n, alpha = alpha))



