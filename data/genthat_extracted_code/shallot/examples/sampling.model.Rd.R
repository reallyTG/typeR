library(shallot)


### Name: sampling.model
### Title: Specifying a Sampling Model
### Aliases: sampling.model

### ** Examples

## Model inputs.
data <- c(-1.48, -1.40, -1.16, -1.08, -1.02, 0.14, 0.51, 0.53, 0.78)
sigma  <- 0.1
mu0    <- 0.0
sigma0 <- 1.0

## Derived values.
s2 <- sigma * sigma
s02 <- sigma0 * sigma0
s02Inv <- 1.0 / s02
c <- -1.0 / (2.0 * s2)

## Sampling model of Neal (JCGS, 2009)
## Function to perform an MCMC update of the parameter.
sample.parameter <- function(indices=c(), parameter=NULL) {
  sum <- sum(data[indices])
  variance <- 1 / (s02Inv + length(indices) / s2)
  mean <- variance * (mu0 / s02 + sum / s2)
  rnorm(1, mean=mean, sd=sqrt(variance))
}

## Function to evaluate the likelihood contribution for an observation.
log.density <- function(i, indices, parameter) {
  resid <- data[i] - parameter
  c * resid * resid
}

sm <- sampling.model(sample.parameter, log.density)
sm



