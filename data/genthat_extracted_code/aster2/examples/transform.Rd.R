library(aster2)


### Name: Transform
### Title: Change-of-Parameter Functions for Aster Models
### Aliases: Transform transformSaturated transformConditional
###   transformUnconditional jacobian validtheta is.validtheta validxi
###   is.validxi
### Keywords: misc

### ** Examples

data(echinacea)
theta <- rnorm(nrow(echinacea$redata), 0, 0.1)
phi <- transformSaturated(theta, echinacea, from = "theta", to = "phi")
## rarely (if ever) want jacobian for unsaturated model transform
## result here is 5130 by 5130 matrix
## Not run: jack <- jacobian(theta, echinacea, from = "theta", to = "phi")



