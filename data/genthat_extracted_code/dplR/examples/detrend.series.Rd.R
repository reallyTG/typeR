library(dplR)


### Name: detrend.series
### Title: Detrend a Ring-Width Series
### Aliases: detrend.series
### Keywords: manip

### ** Examples
library(stats)
library(utils)
## Use series CAM011 from the Campito data set
data(ca533)
series <- ca533[, "CAM011"]
names(series) <- rownames(ca533)
# defaults to all six methods
series.rwi <- detrend.series(y = series, y.name = "CAM011", verbose=TRUE)
# see plot with three methods
series.rwi <- detrend.series(y = series, y.name = "CAM011",
                             method=c("Spline", "ModNegExp","Friedman"),
                             difference=TRUE)
# see plot with two methods
# interesting to note difference from ~200 to 250 years 
# in terms of what happens to low frequency growth
series.rwi <- detrend.series(y = series, y.name = "CAM011",
                             method=c("Spline", "ModNegExp"))
# see plot with just one method and change the spline
# stiffness to 50 years (which is not neccesarily a good choice!)
series.rwi <- detrend.series(y = series, y.name = "CAM011",
                             method="Spline",nyrs=50)
                             
# note that method "Ar" doesn't get plotted in first panel
# since this approach doesn't approximate a growth curve.
series.rwi <- detrend.series(y = series, y.name = "CAM011",
                             method="Ar")
                             
# note the difference between ModNegExp and ModHugershoff at the 
# start of the series. Also notice how curves, etc. are returned
# via return.info
data(co021)
series <- co021[, 4]
names(series) <- rownames(co021)
series.rwi <- detrend.series(y = series, y.name = names(co021)[4],
                             method=c("ModNegExp", "ModHugershoff"),
                             verbose = TRUE, return.info = TRUE, 
                             make.plot = TRUE)




