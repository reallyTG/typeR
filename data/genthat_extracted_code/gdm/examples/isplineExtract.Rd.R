library(gdm)


### Name: isplineExtract
### Title: Extract I-spline Values From a gdm Object.
### Aliases: isplineExtract
### Keywords: gdm

### ** Examples

##sets up site-pair table
load(system.file("./data/gdm.RData", package="gdm"))
sppData <- gdmExpData[, c(1,2,14,13)]
envTab <- gdmExpData[, c(2:ncol(gdmExpData))]
sitePairTab <- formatsitepair(sppData, 2, XColumn="Long", YColumn="Lat", sppColumn="species", 
	siteColumn="site", predData=envTab)

##create GDM
gdmMod <- gdm(sitePairTab, geo=TRUE)

##extracts splines
exSplines <- isplineExtract(gdmMod)

##plot spline(s)
#spline for winter precip (bio19)
plot(exSplines[[1]][,"bio19"], exSplines[[2]][,"bio19"], type="l", 
lwd=3, xlab="Winter precipitation (mm)", ylab="Partial Ecological Distance")



