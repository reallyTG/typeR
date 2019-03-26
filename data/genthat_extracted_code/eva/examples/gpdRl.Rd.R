library(eva)


### Name: gpdRl
### Title: GPD Return Level Estimate and Confidence Interval for Stationary
###   Models
### Aliases: gpdRl

### ** Examples

x <- rgpd(5000, loc = 0, scale = 1, shape = -0.1)
## Compute 50-period return level.
z <- gpdFit(x, nextremes = 200)
gpdRl(z, period = 50, method = "delta")
gpdRl(z, period = 50, method = "profile")



