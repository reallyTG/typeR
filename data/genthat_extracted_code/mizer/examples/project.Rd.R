library(mizer)


### Name: project
### Title: project method for the size based modelling
### Aliases: project project,MizerParams,missing-method
###   project,MizerParams,numeric-method project,MizerParams,array-method

### ** Examples

## Not run: 
##D # Data set with different fishing gears
##D data(NS_species_params_gears)
##D data(inter)
##D params <- MizerParams(NS_species_params_gears, inter)
##D # With constant fishing effort for all gears for 20 time steps
##D sim <- project(params, t_max = 20, effort = 0.5)
##D # With constant fishing effort which is different for each gear
##D effort <- c(Industrial = 0, Pelagic = 1, Beam = 0.5, Otter = 0.5)
##D sim <- project(params, t_max = 20, effort = effort)
##D # With fishing effort that varies through time for each gear
##D gear_names <- c("Industrial","Pelagic","Beam","Otter")
##D times <- seq(from = 1, to = 10, by = 1)
##D effort_array <- array(NA, dim = c(length(times), length(gear_names)),
##D     dimnames = list(time = times, gear = gear_names))
##D effort_array[,"Industrial"] <- 0.5
##D effort_array[,"Pelagic"] <- seq(from = 1, to = 2, length = length(times))
##D effort_array[,"Beam"] <- seq(from = 1, to = 0, length = length(times))
##D effort_array[,"Otter"] <- seq(from = 1, to = 0.5, length = length(times))
##D sim <- project(params, effort = effort_array)
## End(Not run)



