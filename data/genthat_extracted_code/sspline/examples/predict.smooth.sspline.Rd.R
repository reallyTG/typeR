library(sspline)


### Name: predict.smooth.sspline
### Title: Spherical Smoothing Spline Prediction
### Aliases: predict.smooth.sspline
### Keywords: smooth methods

### ** Examples

subdat <- WT9397[sample(nrow(WT9397), 200), 2:4]
attach(subdat)

splobj <- smooth.sspline(lon, lat, avgt)

predict(splobj, lon=seq(-180,180,len=50), lat=seq(-90,90,len=25), grid=TRUE)

detach(subdat)



