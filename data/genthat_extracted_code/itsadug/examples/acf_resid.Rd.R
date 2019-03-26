library(itsadug)


### Name: acf_resid
### Title: Generate an ACF plot of model residuals. Works for lm, lmer,
###   gam, bam, ....
### Aliases: acf_resid

### ** Examples

data(simdat)

# add missing values to simdat:
simdat[sample(nrow(simdat), 15),]$Y <- NA

## Not run: 
##D # Run GAMM model:
##D m1 <- bam(Y ~ te(Time, Trial)+s(Subject, bs='re'), data=simdat)
##D 
##D # Using a list to split the data:
##D acf_resid(m1, split_pred=list(simdat$Subject, simdat$Trial))
##D # ...or using model predictors:
##D acf_resid(m1, split_pred=c("Subject", "Trial"))
##D 
##D # Calling acf_n_plots:
##D acf_resid(m1, split_pred=c("Subject", "Trial"), n=4)
##D # add some arguments:
##D acf_resid(m1, split_pred=c("Subject", "Trial"), n=4, max_lag=10)
##D 
##D # This does not work...
##D m2 <- lm(Y ~ Time, data=simdat)
##D acf_resid(m2, split_pred=c("Subject", "Trial"))
##D # ... but this is ok:
##D acf_resid(m2, split_pred=list(simdat$Subject, simdat$Trial))
##D 
##D # Using AR.start column:
##D simdat <- start_event(simdat, event=c("Subject", "Trial"))
##D r1 <- start_value_rho(m1)
##D m3 <- bam(Y ~ te(Time, Trial)+s(Subject, bs='re'), data=simdat, 
##D     rho=r1, AR.start=simdat$start.event)
##D acf_resid(m3, split_pred="AR.start")
##D # this is the same:
##D acf_resid(m3, split_pred=c("Subject", "Trial"))
##D # Note: use model comparison to find better value for rho
## End(Not run)
# see the vignette for examples:
vignette("acf", package="itsadug")



