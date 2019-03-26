library(antaresRead)


### Name: writeAntaresH5
### Title: Convert antares output to h5 file
### Aliases: writeAntaresH5

### ** Examples


## Not run: 
##D # Write simulation one by one
##D setSimulationPath("C:/Users/MyUser/Mystudy", 1)
##D writeAntaresH5(path="PATH_TO_YOUR_STUDY")
##D 
##D # Write all simulations
##D setSimulationPath("C:/Users/MyUser/Mystudy")
##D writeAntaresH5(path="PATH_TO_YOUR_STUDY", writeAllSimulations = TRUE)
##D 
##D # Choose timestep to write
##D setSimulationPath("C:/Users/MyUser/Mystudy", 1)
##D writeAntaresH5(path="PATH_TO_YOUR_STUDY", timeSteps = "hourly")
##D 
##D # Write with additionnal information
##D writeAntaresH5(path="PATH_TO_YOUR_STUDY", timeSteps = "hourly",
##D    misc = TRUE, thermalAvailabilities = TRUE,
##D    hydroStorage = TRUE, hydroStorageMaxPower = TRUE, reserve = TRUE,
##D    linkCapacity = TRUE, mustRun = TRUE, thermalModulation = TRUE)
##D 
##D # Write all data with a shorcut 
##D writeAntaresH5(path="PATH_TO_YOUR_STUDY", allData = TRUE)
##D 
##D #Remove virtuals areas
##D 
##D writeAntaresH5(path="PATH_TO_YOUR_STUDY", timeSteps = "hourly", overwrite = TRUE,
##D                writeMcAll = FALSE, removeVirtualAreas = TRUE,
##D                storageFlexibility =  "psp in-2",
##D                production =  NULL, reassignCosts =FALSE, newCols = TRUE)
##D                
##D #Remove virtuals areas more than one call
##D writeAntaresH5(
##D                path="PATH_TO_YOUR_STUDY", 
##D                timeSteps = "hourly", 
##D                overwrite = TRUE,
##D                writeMcAll = FALSE, 
##D                removeVirtualAreas = TRUE, 
##D                storageFlexibility = list("psp out", "psp in-2"),
##D                production = list(NULL, NULL), 
##D                reassignCosts = list(TRUE, FALSE), 
##D                newCols = list(FALSE, TRUE)
##D                )
##D 
##D 
## End(Not run)



