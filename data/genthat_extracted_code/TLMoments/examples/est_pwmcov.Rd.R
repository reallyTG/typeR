library(TLMoments)


### Name: est_pwmcov
### Title: Estimate the covariance matrix of PWM estimations
### Aliases: est_pwmcov est_pwmcov.numeric est_pwmcov.matrix

### ** Examples

### Numeric vectors
x <- rgev(500, shape = .2)
est_pwmcov(x)
est_pwmcov(x, distr = "gev")

### Numeric matrices
x <- matrix(rgev(600, shape = .2), nc = 3)
est_pwmcov(x, order = 0:2)
est_pwmcov(x, order = 0:2, distr = "gev")




