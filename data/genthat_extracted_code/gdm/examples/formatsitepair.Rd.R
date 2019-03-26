library(gdm)


### Name: formatsitepair
### Title: Converts Common Biological (Response) and Environmental
###   (Predictor) Data Formats to a GDM Site-Pair Table
### Aliases: formatsitepair
### Keywords: gdm

### ** Examples


##table data, species and environmental
load(system.file("./data/gdm.RData", package="gdm"))
sppData <- gdmExpData[, c(1,2,13,14)]
envTab <- gdmExpData[, c(2:ncol(gdmExpData))]

##environmental raster data
##commented out to reduce example run time
#rastFile <- system.file("./extdata/stackedVars.grd", package="gdm")
#envRast <- stack(rastFile)

#########table type 1
##site-species table without coordinates
testData1a <- reshape2::dcast(sppData, site~species)
##site-species table with coordinates
coords <- unique(sppData[, 2:ncol(sppData)])
testData1b <- merge(testData1a, coords, by="site")
##site-species, table-table
exFormat1a <- formatsitepair(testData1a, 1, siteColumn="site", XColumn="Long", YColumn="Lat",
	predData=envTab)

##site-species, table-raster
##not run
#exFormat1b <- formatsitepair(testData1b, 1, siteColumn="site", XColumn="Long", YColumn="Lat",
#	predData=envRast)

#########table type 2
##site xy spp list, table-table
exFormat2a <- formatsitepair(sppData, 2, XColumn="Long", YColumn="Lat", sppColumn="species",
	siteColumn="site", predData=envTab)
##site xy spp list, table-raster
##commented out to reduce example run time
#exFormat2b <- formatsitepair(sppData, 2, XColumn="Long", YColumn="Lat", sppColumn="species",
#	siteColumn="site", predData=envRast)

#########table type 3
##dissim matrix model
site <- unique(sppData$site)
gdmDissim <- cbind(site, gdmDissim)
exFormat3 <- formatsitepair(gdmDissim, 3, XColumn="Long", YColumn="Lat", predData=envTab,
	siteColumn="site")

#########table type 4
##adds a predictor matrix to an existing site-pair table, in this case, predData needs to be
##filled, but is not actually used
exFormat4 <- formatsitepair(exFormat2a, 4, predData=envTab, siteColumn="site",
	distPreds=list(as.matrix(gdmDissim)))



