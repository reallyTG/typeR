library(antaresRead)


### Name: setSimulationPath
### Title: Set Path to an Antares simulation
### Aliases: setSimulationPath

### ** Examples


## Not run: 
##D # Select interactively a study. It only works on windows.
##D 
##D setSimulationPath()
##D 
##D # Specify path of the study. Note: if there are more than one simulation
##D # output in the study, the function will asks the user to interactively choose
##D # one simulation.
##D 
##D setSimulationPath("path_of_the_folder_of_the_study")
##D 
##D # Select the first simulation of a study
##D 
##D setSimulationPath("path_of_the_folder_of_the_study", 1)
##D 
##D # Select the last simulation of a study
##D 
##D setSimulationPath("path_of_the_folder_of_the_study", -1)
##D 
##D # Select a simulation by name
##D 
##D setSimulationPath("path_of_the_folder_of_the_study", "name of the simulation")
##D 
##D # Just need to read input data
##D 
##D setSimulationPath("path_of_the_folder_of_the_study", "input")
##D # or
##D setSimulationPath("path_of_the_folder_of_the_study", 0)
##D 
##D 
##D 
##D # WORKING WITH MULTIPLE SIMULATIONS
##D #----------------------------------
##D # Let us assume ten simulations have been run and we want to collect the
##D # variable "LOAD" for each area. We can create a list containing options
##D # for each simulation and iterate through this list.
##D 
##D opts <- lapply(1:10, function(i) {
##D    setSimulationPath("path_of_the_folder_of_the_study", i)
##D })
##D 
##D output <- lapply(opts, function(o) {
##D   res <- readAntares(areas = "all", select = "LOAD", timeStep = "monthly", opts = o)
##D   # Add a column "simulation" containing the name of the simulation
##D   res$simulation <- o$name
##D   res
##D })
##D 
##D # Concatenate all the tables in one super table
##D output <- rbindlist(output)
##D 
##D # Reshape output for easier comparisons: one line per timeId and one column
##D # per simulation
##D output <- dcast(output, timeId + areaId ~ simulation, value.var = "LOAD")
##D 
##D output
##D 
##D # Quick visualization
##D matplot(output[area == area[1], !c("area", "timeId"), with = FALSE], 
##D         type = "l")
## End(Not run)




