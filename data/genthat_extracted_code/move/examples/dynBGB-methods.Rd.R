library(move)


### Name: dynBGB
### Title: Calculation of the dynamic Bivariate Gausian Bridge
### Aliases: dynBGB dynBGB,.MoveTrackSingle,RasterLayer,numeric-method
###   dynBGB,.MoveTrackSingle,numeric,ANY-method
###   dynBGB,dBGBvariance,RasterLayer,numeric-method
###   dynBGB,.MoveTrackSingle,ANY,character-method
###   dynBGB,.MoveTrackSingle,missing,ANY-method

### ** Examples

data(leroy)
leroy <- leroy[230:265,]

## change projection method to aeqd and center the coordinate system to the track
dataAeqd <- spTransform(leroy, CRSobj="+proj=aeqd +ellps=WGS84", center=TRUE)

dBGB <- dynBGB(dataAeqd, locErr=9, raster=10, ext=0.5, windowSize=31, margin=15, timeStep=15/20.1)
plot(dBGB, col=hsv(sqrt(1:700/1000)))
lines(dataAeqd)



