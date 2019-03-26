library(irace)


### Name: psRace
### Title: psRace
### Aliases: psRace

### ** Examples

## Not run: 
##D   # Execute the postselection automatically after irace
##D   parameters <- readParameters("parameters.txt")
##D   scenario <- readScenario(filename="scenario.txt", 
##D                            scenario=defaultScenario())
##D   # Use 10% of the total budget
##D   scenario$postselection <- 0.1
##D   irace(scenario=scenario, parameters=parameters)
##D   # Execute the postselection after the execution of \pkg{irace}.
##D   psRace(iraceLogFile="irace.Rdata", max.experiments=120)
## End(Not run)




