library(antaresRead)


### Name: readInputTS
### Title: Read Input time series
### Aliases: readInputTS

### ** Examples

## Not run: 
##D # Set an antares study in "input" mode. This is useful when one want to
##D # inspect input time series before running a simulation.
##D # Note that readAntares do not function in input mode, but readInputTS
##D # works with any mode.
##D 
##D setSimulationPath("path_to_the_study", "input")
##D 
##D # Read load time series
##D readInputTS(load = "all")
##D 
##D # Read hydrolic storage and maximum power in the same call:
##D readInputTS(hydroStorage = "all", hydroStorageMaxPower = "all")
##D 
##D # Use a different time step
##D myArea <- readInputTS(load= "myArea", timeStep = "monthly")
##D 
##D # Quick plot to visualize the variability of the series
##D matplot(myArea[, - (1:2), with = FALSE], type = "l")
## End(Not run)




