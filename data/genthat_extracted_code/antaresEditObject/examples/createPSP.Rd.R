library(antaresEditObject)


### Name: createPSP
### Title: Create a Pumped Storage Power plant (PSP)
### Aliases: createPSP getCapacityPSP editPSP

### ** Examples

## Not run: 
##D 
##D library(antaresEditObject)
##D path<-pathToYourStudy
##D opts<-setSimulationPath(path, simulation = "input")
##D pspData<-data.frame(area=c("a", "b"), installedCapacity=c(800,900))
##D 
##D createPSP(pspData, efficiency = 0.8)
##D 
##D createPSP(pspData, efficiency = 0.66, overwrite = TRUE)
##D createPSP(pspData, efficiency = 0.98, timeStepBindConstraint = "daily")
##D getAreas()
##D 
## End(Not run)

## Not run: 
##D 
##D getCapacityPSP("a")
##D editPSP("a", capacity = 8000, hurdleCost = 0.1)
##D getCapacityPSP("a")
##D 
##D areaName<-"suisse"
##D createArea(areaName, overwrite = TRUE)
##D pspData<-data.frame(area=c(areaName), installedCapacity=c(9856))
##D createPSP(pspData, efficiency = 0.5, overwrite = TRUE, timeStepBindConstraint = "daily")
##D 
##D getCapacityPSP(areaName, timeStepBindConstraint = "daily")
##D 
##D 
## End(Not run)



