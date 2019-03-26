library(itsadug)


### Name: derive_timeseries
### Title: Derive the time series used in the AR1 model.
### Aliases: derive_timeseries

### ** Examples

data(simdat)

# add missing values to simdat:
simdat[sample(nrow(simdat), 15),]$Y <- NA
simdat <- start_event(simdat, event=c("Subject", "Trial"))

## Not run: 
##D # Run GAMM model:
##D m1 <- bam(Y ~ te(Time, Trial)+s(Subject, bs='re'), data=simdat, 
##D     rho=.5, AR.start=simdat$start.event)
##D simdat$Event <- NA
##D simdat[!is.na(simdat$Y),]$Event <- derive_timeseries(m1)
##D acf_resid(m1, split_pred=list(Event=simdat$Event))
##D 
##D # And this works too:
##D simdat$Event <- derive_timeseries(simdat$start.event)
##D acf_resid(m1, split_pred=list(Event=simdat$Event))
##D 
##D # Note that acf_resid automatically makes use of derive_timeseries:
##D acf_resid(m1, split_pred="AR.start")
## End(Not run)



