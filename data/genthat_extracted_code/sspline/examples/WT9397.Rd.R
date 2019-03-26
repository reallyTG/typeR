library(sspline)


### Name: WT9397
### Title: World Average Winter Temperature from 1993-1997
### Aliases: WT9397
### Keywords: datasets

### ** Examples

## Fit a smoothing spherical spline with part of the data
subdat <- WT9397[sample(nrow(WT9397), 200), 2:4]
attach(subdat)

smooth.sspline(lon, lat, avgt)

detach(subdat)



