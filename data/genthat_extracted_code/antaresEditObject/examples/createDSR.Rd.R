library(antaresEditObject)


### Name: createDSR
### Title: Create a Demand Side Response (DSR)
### Aliases: createDSR getCapacityDSR editDSR

### ** Examples

## Not run: 
##D 
##D library(antaresEditObject)
##D path<-pathToYourStudy
##D opts<-setSimulationPath(path, simulation = "input")
##D area, unit, nominalCapacity and marginalCost
##D dsrData<-data.frame(area = c("a", "b"), unit = c(10,20), 
##D                     nominalCapacity = c(100, 120), marginalCost = c(52, 65), hour = c(3, 7))
##D 
##D createDSR(dsrData)
##D 
##D createDSR(dsrData, spinning = 3, overwrite = TRUE)
##D getAreas()
##D 
## End(Not run)
## Not run: 
##D 
##D getCapacityDSR("a")
##D editDSR("a", unit = 50, nominalCapacity = 8000)
##D getCapacityDSR("a")
##D 
## End(Not run)
## Not run: 
##D 
##D getCapacityDSR("a")
##D editDSR("a", unit = 50, nominalCapacity = 8000, marginalCost = 45, hour = 9)
##D getCapacityDSR("a")
##D 
## End(Not run)



