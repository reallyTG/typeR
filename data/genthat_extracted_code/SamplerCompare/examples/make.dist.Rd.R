library(SamplerCompare)


### Name: make.dist
### Title: Define a probability distribution object
### Aliases: make.dist

### ** Examples

  # A one dimensional Gamma(3,2) distribution.

  # So that the density does not return NaN outside the support.
  inflog <- function(x) ifelse(x<=0, -Inf, log(x))

  # Define density; unnormalized densities are fine.

  gamma32.log.density <- function(x) (3-1)*inflog(x) - x/2
  gamma32.grad <- function(x) (3-1)/x - 1/2

  # Use make.dist to define the distribution object.

  gamma32.dist <- make.dist(1, 'Gamma32', 'plain("Gamma")(3,2)',
                            log.density=gamma32.log.density,
                            grad.log.density=gamma32.grad,
                            mean=3*2, cov=as.matrix(3*2^2))

  # Make sure the log density and gradient agree at an arbitrary point.

  check.dist.gradient(gamma32.dist, 17)



