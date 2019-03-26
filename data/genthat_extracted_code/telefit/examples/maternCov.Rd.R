library(telefit)


### Name: maternCov
### Title: Matern covariance
### Aliases: maternCov

### ** Examples

data("coprecip")
attach(coprecip)

# compute spatial covariance matrix for an exponential covariance function
# using Colorado coordinates
Sigma = maternCov(fields::rdist.earth(coords.s), scale = 1, range = 250,
  smoothness = .5, nugget = 0)




