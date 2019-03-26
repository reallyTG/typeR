library(surveillance)


### Name: calibrationTest
### Title: Calibration Tests for Poisson or Negative Binomial Predictions
### Aliases: calibrationTest calibrationTest.default
### Keywords: htest

### ** Examples

mu <- c(0.1, 1, 3, 6, pi, 100)
size <- 0.1
set.seed(1)
y <- rnbinom(length(mu), mu = mu, size = size)
calibrationTest(y, mu = mu, size = size) # p = 0.99
calibrationTest(y, mu = mu, size = 1) # p = 4.3e-05
calibrationTest(y, mu = 1, size = size) # p = 0.6959
calibrationTest(y, mu = 1, size = size, which = "rps") # p = 0.1286



