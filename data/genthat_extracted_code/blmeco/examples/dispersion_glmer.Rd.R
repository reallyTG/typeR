library(blmeco)


### Name: dispersion_glmer
### Title: Measures dispersion in a glmer-model
### Aliases: dispersion_glmer
### Keywords: misc model checking

### ** Examples

## Not run: 
##D data(swallowfarms)
##D dat <- swallowfarms
##D dat$colsize.z <- scale(dat$colsize)   # scaled values for better model convergence
##D dat$dung.z    <- scale(dat$dung)
##D dat$die <- dat$clutch - dat$fledge
##D mod <- glmer(cbind(fledge,die) ~ colsize.z + cow + dung.z + (1|farm) , data=dat, family="binomial")
##D dispersion_glmer(mod)
## End(Not run)



