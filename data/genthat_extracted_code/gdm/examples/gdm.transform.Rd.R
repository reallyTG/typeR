library(gdm)


### Name: gdm.transform
### Title: Transform Environmental Data Using a Generalized Dissimilarity
###   Model
### Aliases: gdm.transform
### Keywords: gdm

### ** Examples

load(system.file("./data/gdm.RData", package="gdm"))

# grab the columns with xy, site ID, and species data 
sppTab <- gdmExpData[, c("species", "site", "Lat", "Long")]

##fit gdm using rasters
rastFile <- system.file("./extdata/stackedVars.grd", package="gdm")
envRast <- stack(rastFile)
sitePairRast <- formatsitepair(sppTab, 2, XColumn="Long", YColumn="Lat", sppColumn="species",
	siteColumn="site", predData=envRast)
##remove NA values
sitePairRast <- na.omit(sitePairRast)

##fit raster GDM
gdmRastMod <- gdm(sitePairRast, geo=TRUE)

##raster input, raster output
transRasts <- gdm.transform(gdmRastMod, envRast)

# map biological patterns
rastDat <- sampleRandom(transRasts, 10000)
pcaSamp <- prcomp(rastDat)
 
# note the use of the 'index' argument
pcaRast <- predict(transRasts, pcaSamp, index=1:3)

# scale rasters
pcaRast[[1]] <- (pcaRast[[1]]-pcaRast[[1]]@data@min) /
  (pcaRast[[1]]@data@max-pcaRast[[1]]@data@min)*255
pcaRast[[2]] <- (pcaRast[[2]]-pcaRast[[2]]@data@min) /
  (pcaRast[[2]]@data@max-pcaRast[[2]]@data@min)*255
pcaRast[[3]] <- (pcaRast[[3]]-pcaRast[[3]]@data@min) /
  (pcaRast[[3]]@data@max-pcaRast[[3]]@data@min)*255

plotRGB(pcaRast, r=1, g=2, b=3)




