library(move)


### Name: dynBGBvariance
### Title: Calculates the Bivariate Gaussian Bridge motion variance
### Aliases: dynBGBvariance
###   dynBGBvariance,.MoveTrackSingle,numeric,numeric,numeric-method

### ** Examples

data(leroy)
leroy <- leroy[230:265,]

## change projection method to aeqd and center the coordinate system to the track
dataAeqd <- spTransform(leroy, CRSobj="+proj=aeqd +ellps=WGS84", center=TRUE)

dBGBvar <- dynBGBvariance(dataAeqd, locErr=9, windowSize=31, margin=15)
dBGBvar



