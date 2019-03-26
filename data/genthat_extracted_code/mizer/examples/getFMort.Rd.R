library(mizer)


### Name: getFMort
### Title: Get the total fishing mortality rate from all fishing gears by
###   time, species and size.
### Aliases: getFMort getFMort,MizerParams,numeric-method
###   getFMort,MizerParams,matrix-method getFMort,MizerSim,missing-method

### ** Examples

## Not run: 
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # Get the total fishing mortality when effort is constant for all 
##D # gears and time:
##D getFMort(params, effort = 1)
##D # Get the total fishing mortality when effort is different
##D # between the four gears but constant in time:
##D getFMort(params, effort = c(0.5,1,1.5,0.75))
##D # Get the total fishing mortality when effort is different
##D # between the four gears and changes with time:
##D effort <- array(NA, dim = c(20,4))
##D effort[,1] <- seq(from=0, to = 1, length=20)
##D effort[,2] <- seq(from=1, to = 0.5, length=20)
##D effort[,3] <- seq(from=1, to = 2, length=20)
##D effort[,4] <- seq(from=2, to = 1, length=20)
##D getFMort(params, effort=effort)
##D # Get the total fishing mortality using the effort already held in a 
##D # MizerSim object.
##D sim <- project(params, t_max = 20, effort = 0.5)
##D getFMort(sim)
##D getFMort(sim, time_range = c(10,20))
## End(Not run)



