library(bfast)


### Name: bfastmonitor
### Title: Near Real-Time Disturbance Detection Based on BFAST-Type Models
### Aliases: bfastmonitor
### Keywords: ts

### ** Examples


## See Fig. 6 a and b in Verbesselt et al. (2011)
## for more information about the data time series and acknowledgements

library(zoo)
NDVIa <- as.ts(zoo(som$NDVI.a, som$Time))
plot(NDVIa)
## apply the bfast monitor function on the data
## start of the monitoring period is c(2010, 13)
## and the ROC method is used as a method to automatically identify a stable history
mona <- bfastmonitor(NDVIa, start = c(2010, 13))
mona
plot(mona)
## fitted season-trend model in history period
summary(mona$model)
## OLS-based MOSUM monitoring process
plot(mona$mefp, functional = NULL)
## the pattern in the running mean of residuals
## this illustrates the empirical fluctuation process
## and the significance of the detected break.

NDVIb <- as.ts(zoo(som$NDVI.b, som$Time))
plot(NDVIb)
monb <- bfastmonitor(NDVIb, start = c(2010, 13))
monb
plot(monb)
summary(monb$model)
plot(monb$mefp, functional = NULL)

## set the stable history period manually and use a 4th order harmonic model
bfastmonitor(NDVIb, start = c(2010, 13),
  history = c(2008, 7), order = 4, plot = TRUE)

## just use a 6th order harmonic model without trend
mon <- bfastmonitor(NDVIb, formula = response ~ harmon,
    start = c(2010, 13), order = 6, plot = TRUE)
summary(mon$model)

## For more info
?bfastmonitor


## TUTORIAL for processing raster bricks (satellite image time series of 16-day NDVI images)
f <- system.file("extdata/modisraster.grd", package="bfast")
library("raster")
modisbrick <- brick(f)
data <- as.vector(modisbrick[1])
ndvi <- bfastts(data, dates, type = c("16-day"))
plot(ndvi/10000)

## derive median NDVI of a NDVI raster brick
medianNDVI <- calc(modisbrick, fun=function(x) median(x, na.rm = TRUE))
plot(medianNDVI)

## helper function to be used with the calc() function
xbfastmonitor <- function(x,dates) {
	ndvi <- bfastts(x, dates, type = c("16-day"))
	ndvi <- window(ndvi,end=c(2011,14))/10000
	## delete end of the time to obtain a dataset similar to RSE paper (Verbesselt et al.,2012)
	bfm <- bfastmonitor(data = ndvi, start=c(2010,12), history = c("ROC"))
	return(cbind(bfm$breakpoint, bfm$magnitude))
}

## apply on one pixel for testing
ndvi <- bfastts(as.numeric(modisbrick[1])/10000, dates, type = c("16-day"))
plot(ndvi)

bfm <- bfastmonitor(data = ndvi, start=c(2010,12), history = c("ROC"))
bfm$magnitude
plot(bfm)
xbfastmonitor(modisbrick[1], dates) ## helper function applied on one pixel

## Not run: 
##D ## apply the bfastmonitor function onto a raster brick
##D library(raster)
##D timeofbreak <- calc(modisbrick, fun=function(x){
##D   res <- t(apply(x, 1, xbfastmonitor, dates))
##D 	return(res)
##D })
##D 
##D plot(timeofbreak) ## time of break and magnitude of change
##D plot(timeofbreak,2) ## magnitude of change
##D 
##D ## create a KMZ file and look at the output
##D KML(timeofbreak, "timeofbreak.kmz")
## End(Not run)




