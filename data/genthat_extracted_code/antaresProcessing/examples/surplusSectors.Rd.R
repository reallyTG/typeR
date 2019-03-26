library(antaresProcessing)


### Name: surplusSectors
### Title: Compute the surplus of sectors
### Aliases: surplusSectors

### ** Examples

## Not run: 
##D 
##D # Data required by the function:
##D showAliases("surplusSectors")
##D 
##D mydata <- readAntares(select = "surplusSectors")
##D surplusSectors(mydata)
##D 
##D # Note that if the parameter "sectors" is modified, the function can require
##D # more or less data. For instance, if one only wants surplus for thermal
##D # sectors:
##D mydata <- readAntares(areas = "all", clusters = "all", synthesis = FALSE,
##D                       select = "MRG. PRICE")
##D surplusSectors(mydata, sectors = "thermal")
##D 
## End(Not run)




