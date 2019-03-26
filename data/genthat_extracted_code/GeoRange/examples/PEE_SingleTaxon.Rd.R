library(GeoRange)


### Name: PEE_SingleTaxon
### Title: Function to calculate PEE [1] matrices for all the geographic
###   range measures
### Aliases: PEE_SingleTaxon

### ** Examples

## Not run: 
##D data(BivalvePBDB)
##D BivalveMatrix<-CoordList_PBDB(BivalvePBDB)
##D BivalveGeo<-GeoRarefaction_MultiTaxa(nLocCut=50,OccMatrix=BivalveMatrix,TaxaStart=3,iter=20)
##D PEE_SingleTaxon(GeoRare=BivalveGeo,TName=names(BivalveGeo)[3])
## End(Not run)



