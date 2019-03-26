library(SpatialExtremes)


### Name: logLik
### Title: Extracts Log-Likelihood
### Aliases: logLik logLik.maxstab logLik.copula
### Keywords: models

### ** Examples

##Define the coordinates of each location
n.site <- 30
locations <- matrix(5 + runif(2*n.site, 0, 10), ncol = 2)

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(30, locations, cov.mod = "whitmat", nugget = 0, range = 3,
smooth = 0.5)
fit <- fitmaxstab(data, locations, "whitmat")
logLik(fit)



