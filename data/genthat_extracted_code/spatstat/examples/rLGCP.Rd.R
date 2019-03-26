library(spatstat)


### Name: rLGCP
### Title: Simulate Log-Gaussian Cox Process
### Aliases: rLGCP
### Keywords: spatial datagen

### ** Examples

  if(require(RandomFields)) {
  # homogeneous LGCP with exponential covariance function
  X <- rLGCP("exp", 3, var=0.2, scale=.1)

  # inhomogeneous LGCP with Gaussian covariance function
  m <- as.im(function(x, y){5 - 1.5 * (x - 0.5)^2 + 2 * (y - 0.5)^2}, W=owin())
  X <- rLGCP("gauss", m, var=0.15, scale =0.5)
  plot(attr(X, "Lambda"))
  points(X)

  # inhomogeneous LGCP with Matern covariance function
  X <- rLGCP("matern", function(x, y){ 1 - 0.4 * x},
             var=2, scale=0.7, nu=0.5,
             win = owin(c(0, 10), c(0, 10)))
  plot(X)
  }



