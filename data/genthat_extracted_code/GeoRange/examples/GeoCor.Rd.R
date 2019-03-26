library(GeoRange)


### Name: GeoCor
### Title: Function to calculate the correlation coefficient for pairwise
###   comparisons between geographic range measures
### Aliases: GeoCor

### ** Examples

## Not run: 
##D data(BivalvePBDB)
##D BivalveMatrix<-CoordList_PBDB(BivalvePBDB)
##D testBivalve<-GeoRange_MultiTaxa(OccMatrix=BivalveMatrix,TaxaStart=3)
##D GeoCor(testBivalve,Start=1,method="kendall")
## End(Not run)



