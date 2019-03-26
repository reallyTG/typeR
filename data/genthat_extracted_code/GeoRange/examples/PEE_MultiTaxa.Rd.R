library(GeoRange)


### Name: PEE_MultiTaxa
### Title: Function to compile the PBDB_PEE_SingleTaxon output for a list
###   of taxa
### Aliases: PEE_MultiTaxa

### ** Examples

## Not run: 
##D data(BivalvePBDB)
##D BivalveMatrix<-CoordList_PBDB(BivalvePBDB)
##D BivalveGeo<-GeoRarefaction_MultiTaxa(nLocCut=20,OccMatrix=BivalveMatrix,TaxaStart=3,replacePts=TRUE)
##D PEE_MultiTaxa(BivalveGeo)
## End(Not run)



