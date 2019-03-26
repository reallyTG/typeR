library(partialAR)


### Name: estimate.par
### Title: Estimates the parameters of a partially autoregressive fit using
###   lagged variances
### Aliases: estimate.par
### Keywords: models ts

### ** Examples

set.seed(1)
x <- rpar(1000, 0.5, 1, 2)  # Generate a random PAR sequence
estimate.par(x)
fit.par(x)  # For comparison



