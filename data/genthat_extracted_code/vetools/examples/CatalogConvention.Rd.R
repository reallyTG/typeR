library(vetools)


### Name: CatalogConvention
### Title: 'vetools' Catalog Convention White Sheet (Revision 3)
### Aliases: CatalogConvention 'Catalog Convention' 'vetools Catalog
###   Convention'
### Keywords: catalog

### ** Examples
## Not run: 
##D # This collection has only one station
##D Collection <- read.MARN(system.file("tests/test-MARN.dat", package="vetools"))
##D summary(Collection)
##D plot(Collection$data)
##D # This collection has many stations
##D Collection.H <- read.HIDROX(system.file("tests/test-HIDROX.csv", package="vetools"))
##D summary(Collection.H)
##D plot(Collection.H$data[[4]])
## End(Not run)


