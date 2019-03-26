library(PVAClone)


### Name: growth-models
### Title: Growth models
### Aliases: growthmodels gompertz ricker bevertonholt thetalogistic
###   thetalogistic_D
### Keywords: utils models ts

### ** Examples

gompertz()
gompertz("poisson")
ricker("normal")
ricker("normal", fixed=c(a=5, sigma=0.5))
thetalogistic("none", fixed=c(theta=1))
bevertonholt("normal", fixed=c(theta=1))

## alternative priors
ricker("normal", fixed=c(a="a ~ dnorm(2, 1)"))@model
ricker("normal", fixed=list(a="a ~ dnorm(2, 1)", sigma=0.5))@model



