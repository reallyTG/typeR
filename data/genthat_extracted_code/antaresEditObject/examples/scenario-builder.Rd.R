library(antaresEditObject)


### Name: scenario-builder
### Title: Read, create & update scenario builder
### Aliases: scenario-builder scenarioBuilder readScenarioBuilder
###   updateScenarioBuilder

### ** Examples

## Not run: 
##D 
##D library(antaresRead)
##D library(antaresEditObject)
##D 
##D # simulation path
##D setSimulationPath(
##D   path = "pat/to/simulation",
##D   simulation = "input"
##D )
##D 
##D # Create a scenario builder matrix
##D sbuilder <- scenarioBuilder(
##D   n_scenario = 51,
##D   n_mc = 2040,
##D   areas_rand = c("fr", "be")
##D )
##D sbuilder[, 1:6]
##D dim(sbuilder)
##D 
##D 
##D # Read previous scenario builder
##D # in a matrix format
##D prev_sb <- readScenarioBuilder()
##D 
##D 
##D # Update scenario builder
##D 
##D # for load serie
##D updateScenarioBuilder(ldata = sbuilder, series = "load")
##D 
##D # equivalent as
##D updateScenarioBuilder(ldata = list(l = sbuilder))
##D 
##D 
##D # update several series
##D 
##D # same input
##D sbuilder
##D updateScenarioBuilder(
##D   ldata = sbuilder, 
##D   series = c("load", "hydro", "solar")
##D )
##D 
##D # different input
##D updateScenarioBuilder(ldata = list(
##D   l = load_sb,
##D   h = hydro_sb,
##D   s = solar_sb
##D ))
##D 
## End(Not run)



