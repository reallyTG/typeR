library(antaresProcessing)


### Name: surplusClusters
### Title: Compute the surplus of clusters
### Aliases: surplusClusters

### ** Examples

## Not run: 
##D # Data required by the function:
##D showAliases("surplusClusters")
##D 
##D mydata <- readAntares(select = "surplusClusters")
##D surplusClusters(mydata)
##D 
##D # Computing the surplus of the last unit of a cluster requires the additional
##D # column "availableUnits". To add this column, one has to use parameter
##D # "thermalAvailabilities = TRUE" in readAntares.
##D 
##D mydata <- readAntares(select = c("surplusClusters", "thermalAvailabilities"))
##D surplusClusters(mydata, surplusLastUnit = TRUE)
##D 
## End(Not run)




