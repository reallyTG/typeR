library(MareyMap)


### Name: MareyMap-class
### Title: Class "MareyMap"
### Aliases: MareyMap MareyMap,data.frame,ANY,ANY,ANY-method MareyMap-class
###   [,MareyMap-method [[<-,MareyMap-method
###   [[<-,MareyMap,ANY,ANY,ANY-method [[,MareyMap-method
###   +,MareyMap,Interpolation-method coerce,MareyMap,data.frame-method
###   coerce,data.frame,MareyMap-method coerce,MareyMap,NULL-method
###   geneticDistances<-,MareyMap-method geneticDistances,MareyMap-method
###   interpolation<-,MareyMap,character,Interpolation-method
###   interpolation,MareyMap,character-method
###   interpolations<-,MareyMap-method interpolations,MareyMap-method
###   mapName<-,MareyMap-method mapName,MareyMap-method
###   markerNames<-,MareyMap-method markerNames,MareyMap-method
###   markerValidity<-,MareyMap-method markerValidity,MareyMap-method
###   physicalPositions<-,MareyMap-method physicalPositions,MareyMap-method
###   plot,MareyMap,missing-method plotMarkers,MareyMap-method
###   plotModels,MareyMap-method plotRates,MareyMap-method
###   query,MareyMap,numeric-method removeMarker,MareyMap,integer-method
###   setName<-,MareyMap,ANY-method setName,MareyMap-method
###   setName,MareyMap-method textFile,MareyMap,character-method
###   validPositions,MareyMap-method
### Keywords: classes

### ** Examples

data(Homo_sapiens_male)
chr7 <- Homo_sapiens_male[["Chromosome 07"]]
chr7 <- chr7 + MMLoess()
par(mfrow = c(2, 1))
plotMarkers(chr7)



