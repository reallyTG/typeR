library(esaddle)


### Name: rsaddle
### Title: Simulate random variables from the Extended Empirical
###   Saddlepoint density (ESS)
### Aliases: rsaddle

### ** Examples

# Simulate bivariate data, where each marginal distribution is Exp(2)
X <- matrix(rexp(2 * 1e3), 1e3, 2)

# Simulate bivariate data from a saddlepoint fitted to X
Z <- rsaddle(1000, X, decay = 0.5)

# Look at first marginal distribution
hist( Z[ , 1] )



