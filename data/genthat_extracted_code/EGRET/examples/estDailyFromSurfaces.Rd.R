library(EGRET)


### Name: estDailyFromSurfaces
### Title: Estimates all daily values of Concentration, Flux,
###   Flow-Normalized Concentration, and Flow Normalized Flux
### Aliases: estDailyFromSurfaces getConcFluxFromSurface
###   getSurfaceEstimates bin_Qs
### Keywords: statistics water-quality

### ** Examples

eList <- Choptank_eList
#################################################
# This is usually done in modelEstimation:
Daily <- getDaily(eList)
surfaceIndexParameters<-surfaceIndex(Daily)
INFO <- eList$INFO
INFO$bottomLogQ<-surfaceIndexParameters[['bottomLogQ']]
INFO$stepLogQ<-surfaceIndexParameters[['stepLogQ']]
INFO$nVectorLogQ<-surfaceIndexParameters[['nVectorLogQ']]
INFO$bottomYear<-surfaceIndexParameters[['bottomYear']]
INFO$stepYear<-surfaceIndexParameters[['stepYear']]
INFO$nVectorYear<-surfaceIndexParameters[['nVectorYear']]
eList$INFO <- INFO
#################################################
## Not run: 
##D Daily <- estDailyFromSurfaces(eList)
## End(Not run)



