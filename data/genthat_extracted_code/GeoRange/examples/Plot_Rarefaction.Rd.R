library(GeoRange)


### Name: Plot_Rarefaction
### Title: Plots the measured value versus rarefied samples or percent
###   error of estimates (PEE) of a rarefied samples for a geographic range
###   measure
### Aliases: Plot_Rarefaction

### ** Examples

## Not run: 
##D data(BivalvePBDB)
##D BivalveMatrix<-CoordList_PBDB(BivalvePBDB)
##D BivalveGeo<-GeoRarefaction_MultiTaxa(nLocCut=20,OccMatrix=BivalveMatrix,TaxaStart=3,replacePts=TRUE)
##D BivalvePEE<-PEE_MultiTaxa(BivalveGeo)
##D Plot_Rarefaction(BivalvePEE,BivalveGeo,symbol=20,measure=2,SampSize=2)
## End(Not run)



