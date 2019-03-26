library(sspline)


### Name: WT6367
### Title: World Average Winter Temperature from 1963-1967
### Aliases: WT6367
### Keywords: datasets

### ** Examples

## Fit a smoothing spherical spline with part of the data
subdat <- WT6367[sample(nrow(WT6367), 200), 2:4]
attach(subdat)

smooth.sspline(lon, lat, avgt)

detach(subdat)



