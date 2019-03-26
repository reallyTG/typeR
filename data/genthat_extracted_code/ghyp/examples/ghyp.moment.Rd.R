library(ghyp)


### Name: ghyp.moment
### Title: Compute moments of generalized hyperbolic distributions
### Aliases: ghyp.moment
### Keywords: utilities

### ** Examples

  nig.uv <- NIG(alpha.bar = 0.1, mu = 1.1, sigma = 3, gamma = -2)

  # Moments of integer order
  ghyp.moment(nig.uv, order = 1:6)

  # Moments of fractional order
  ghyp.moment(nig.uv, order = 0.2 * 1:20, absolute = TRUE)



