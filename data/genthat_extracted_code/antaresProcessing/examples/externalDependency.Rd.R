library(antaresProcessing)


### Name: externalDependency
### Title: External Dependencies in imports and exports
### Aliases: externalDependency

### ** Examples

## Not run: 
##D # Data required by the function
##D showAliases("externalDependency")
##D 
##D mydata <- readAntares(select = "externalDependency")
##D addNetLoad(mydata)
##D externalDependency(mydata)
##D 
##D # if there are some virtual pumping/storage areas, remove them with
##D # removeVirtualAreas
##D mydata <- removeVirtualAreas(mydata, c("pumping", "storage"))
##D externalDependency(mydata, ignoreMustRun = TRUE)
## End(Not run)




