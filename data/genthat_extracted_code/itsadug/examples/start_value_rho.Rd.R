library(itsadug)


### Name: start_value_rho
### Title: Extract the Lag 1 value from the ACF of the residuals of a gam,
###   bam, lm, lmer model, ...
### Aliases: start_value_rho

### ** Examples

data(simdat)

# add missing values to simdat:
simdat[sample(nrow(simdat), 15),]$Y <- NA

## Not run: 
##D # Run GAMM model:
##D m1 <- bam(Y ~ te(Time, Trial)+s(Subject, bs='re'), data=simdat)
##D 
##D # No plotting:
##D start_value_rho(m1)
##D # With plot:
##D rhom1 <- start_value_rho(m1, plot=TRUE)
##D 
## End(Not run)
# see the vignette for examples:
vignette("acf", package="itsadug")



