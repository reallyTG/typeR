library(antaresProcessing)


### Name: addConvergencePriceSystem
### Title: addConvergencePriceSystem
### Aliases: addConvergencePriceSystem

### ** Examples

## Not run: 
##D 
##D   myData <- readAntares(areas = "all",
##D   links = "all",
##D   showProgress = FALSE,
##D   linkCapacity = TRUE,
##D   mcYears = "all")
##D 
##D   myDataRV <- removeVirtualAreas(x = myData,
##D   storageFlexibility = getAreas(c("psp", "hub")),
##D   production = getAreas("off"))
##D 
##D   addConvergencePriceSystem(myData)
## End(Not run)



