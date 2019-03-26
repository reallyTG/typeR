library(Bolstad2)


### Name: pNull
### Title: Test a one sided hypothesis from a numerically specified
###   posterior CDF or from a sample from the posterior
### Aliases: pNull

### ** Examples

## commands for calculating a numerical posterior CDF.
## In this example, the likelihood is proportional to
## \eqn{\theta^{3/2}\times \exp(-\theta/4)} and a N(6, 9) prior is used.
theta <- seq(from = 0.001, to = 40, by = 0.001)
prior <- dnorm(theta,6,3)
ppnLike <- theta^1.5*exp(-theta/4)
ppnPost <- prior*ppnLike
scaleFactor <- sintegral(theta, ppnPost)$int
posterior <- ppnPost/scaleFactor
cdf <- sintegral(theta, posterior)$y
pNull(15, theta, cdf)

## Use an inverse method to take a random sample of size 1000
## from the posterior
suppressWarnings(Finv <- approxfun(cdf, theta))
thetaSample<-Finv(runif(1000))
pNull(15, thetaSample)



