library(sspline)


### Name: WTdiff
### Title: World Average Winter Temperature Change (1963-1967 Vs 1993-1997)
### Aliases: WTdiff
### Keywords: datasets

### ** Examples

## Fit a smoothing spherical spline with part of the data
subdat <- WTdiff[sample(nrow(WTdiff), 200), 2:4]
attach(subdat)

smooth.sspline(lon, lat, avgd)

detach(subdat)



