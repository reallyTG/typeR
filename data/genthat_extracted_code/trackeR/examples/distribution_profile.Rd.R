library(trackeR)


### Name: distribution_profile
### Title: Generate training distribution profiles.
### Aliases: distribution_profile distrProfile distributionProfile

### ** Examples

data('run', package = 'trackeR')
dProfile <- distribution_profile(run, what = c("speed", "cadence_running"))
## Not run: 
##D plot(dProfile, smooth = FALSE)
## End(Not run)



