library(bpp)


### Name: NormalNormalPosterior
### Title: Normal-Normal Posterior in conjugate normal model, for known
###   sigma
### Aliases: NormalNormalPosterior
### Keywords: htest

### ** Examples

## data:
n <- 25
sd0 <- 3
x <- rnorm(n, mean = 2, sd = sd0)

## prior:
nu <- 0
tau <- 2

## posterior:
NormalNormalPosterior(datamean = mean(x), datasigma = sd0, n = 77, nu = nu, tau = tau)



