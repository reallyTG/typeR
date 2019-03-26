library(tsBSS)


### Name: lbtest
### Title: Modified Ljung-Box test and volatility clustering test for time
###   series.
### Aliases: lbtest

### ** Examples

library(stochvol)
n <- 10000
s1 <- svsim(n, mu = -10, phi = 0.95, sigma = 0.1)$y
s2 <- rnorm(n)
S <- cbind(s1, s2)

lbtest(S, 1:3, type = "squared")
# First p-value should be very close to zero, as there exists stochastic volatility




