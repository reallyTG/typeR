library(sspline)


### Name: smooth.sspline
### Title: Smoothing Spline on the Sphere
### Aliases: smooth.sspline
### Keywords: smooth

### ** Examples

subdat <- WTdiff[sample(nrow(WTdiff), 200), 2:4]
attach(subdat)

smooth.sspline(lon, lat, avgd)

detach(subdat)



