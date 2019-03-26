library(trajr)


### Name: TrajsMergeStats
### Title: Merge trajectory characteristics
### Aliases: TrajsMergeStats

### ** Examples

## Not run: 
##D 
##D # Define a function which calculates some statistics
##D # of interest for a single trajectory
##D characteriseTrajectory <- function(trj) {
##D   # Measures of speed
##D   derivs <- TrajDerivatives(trj)
##D   mean_speed <- mean(derivs$speed)
##D   sd_speed <- sd(derivs$speed)
##D 
##D   # Measures of straightness
##D   sinuosity <- TrajSinuosity(trj)
##D   Emax <- TrajEmax(resampled)
##D 
##D   # Periodicity
##D   resampled <- TrajRediscretize(trj, .001)
##D   corr <- TrajDirectionAutocorrelations(resampled, round(nrow(resampled) / 4))
##D   first_min <- TrajDAFindFirstMinimum(corr)
##D 
##D   # Return a list with all of the statistics for this trajectory
##D   list(mean_speed = mean_speed,
##D        sd_speed = sd_speed,
##D        sinuosity = sinuosity,
##D        Emax = Emax,
##D        first_min_deltaS = first_min[1],
##D        first_min_C = first_min[2])
##D }
##D 
##D trjs <- TrajsBuild(filenames)
##D stats <- TrajsMergeStats(trjs, characteriseTrajectory)
## End(Not run)




