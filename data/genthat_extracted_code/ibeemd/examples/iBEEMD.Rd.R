library(ibeemd)


### Name: iBEEMD
### Title: Scale decomposition for polygon data.
### Aliases: iBEEMD
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D library(rgdal)
##D 
##D # polygon data
##D mydata <- system.file("extdata/simu.shp", package = "ibeemd")
##D 
##D layer <- basename(mydata)
##D layer <- substr(layer, 1, nchar(layer)-4)
##D mydataDf <- readOGR(dsn=mydata, layer=layer)
##D #spplot(mydataDf)
##D 
##D rslt <- iBEEMD(
##D 		spPolysDf = mydataDf, 
##D 		valueField = "value",  
##D 		nMaxIMF = 10, 
##D 		tolSift = 0.05,
##D 		neemd = 500,
##D 		wnsd = 0.05,
##D 		fmodel = "thinplate",
##D 		fig = TRUE)
## End(Not run)
#spplot(rslt)



