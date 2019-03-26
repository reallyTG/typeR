library(antaresRead)


### Name: changeTimeStep
### Title: Change the timestep of an output
### Aliases: changeTimeStep

### ** Examples

## Not run: 
##D setSimulationPath()
##D 
##D areasH <- readAntares(select = "LOAD", synthesis = FALSE, mcYears = 1)
##D areasD <- readAntares(select = "LOAD", synthesis = FALSE, mcYears = 1, timeStep ="daily")
##D 
##D areasDAgg <- changeTimeStep(areasH, "daily", "hourly")
##D 
##D all.equal(areasDAgg$LOAD, areasD$LOAD)
##D 
##D # Use different aggregation functions
##D mydata <- readAntares(select = c("LOAD", "MRG. PRICE"), timeStep = "monthly")
##D changeTimeStep(mydata, "annual", fun = c("sum", "mean"))
## End(Not run)




