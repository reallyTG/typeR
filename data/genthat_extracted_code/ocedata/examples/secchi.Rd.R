library(ocedata)


### Name: secchi
### Title: Secchi depth dataset
### Aliases: secchi
### Keywords: datasets

### ** Examples

## Not run: 
##D library(oce)
##D data(secchi, package="ocedata")
##D mapPlot(coastlineWorld, longitudelim=c(-5, 20), latitudelim=c(50, 66),
##D         grid=5, fill='gray', proj="lambert",
##D         parameters=c(lat0=50, lat1=65))
##D col <- rev(oceColorsJet(100))[rescale(secchi$depth, xlow=0, xhigh=20, rlow=1, rhigh=100)]
##D mapPoints(secchi$longitude, secchi$latitude, pch=20, cex=1, col=col)
##D mapPolygon(coastlineWorld, col='gray')
## End(Not run)



