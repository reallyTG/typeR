library(mizer)


### Name: getFMortGear
### Title: Get the fishing mortality by time, gear, species and size
### Aliases: getFMortGear getFMortGear,MizerParams,numeric-method
###   getFMortGear,MizerParams,matrix-method
###   getFMortGear,MizerSim,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # Get the fishing mortality when effort is constant
##D # for all gears and time:
##D getFMortGear(params, effort = 1)
##D # Get the fishing mortality when effort is different
##D # between the four gears but constant in time:
##D getFMortGear(params, effort = c(0.5,1,1.5,0.75))
##D # Get the fishing mortality when effort is different
##D # between the four gears and changes with time:
##D effort <- array(NA, dim = c(20,4))
##D effort[,1] <- seq(from=0, to = 1, length=20)
##D effort[,2] <- seq(from=1, to = 0.5, length=20)
##D effort[,3] <- seq(from=1, to = 2, length=20)
##D effort[,4] <- seq(from=2, to = 1, length=20)
##D getFMortGear(params, effort=effort)
##D # Get the fishing mortality using the effort already held in a MizerSim object.
##D sim <- project(params, t_max = 20, effort = 0.5)
##D getFMortGear(sim)
##D getFMortGear(sim, time_range=c(10,20))
## End(Not run)



