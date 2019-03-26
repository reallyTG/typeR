library(itsadug)


### Name: check_resid
### Title: Inspect residuals of regression models.
### Aliases: check_resid

### ** Examples

data(simdat)

## Not run: 
##D # Add start event column:
##D simdat <- start_event(simdat, event=c("Subject", "Trial"))
##D head(simdat)
##D 
##D # bam model with AR1 model (toy example, not serious model):
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group), 
##D    data=simdat, rho=.5, AR.start=simdat$start.event)
##D 
##D # Warning, no time series specified:
##D check_resid(m1)
##D 
##D # Time series specified, results in a "standard" ACF plot, 
##D # treating all residuals as single time seriesand,
##D # and an ACF plot with the average ACF over time series:
##D check_resid(m1, split_pred=list(Subject=simdat$Subject, Trial=simdat$Trial))
##D # Note: residuals do not look very good.
##D # Alternative (results in the same, see help(acf_resid) ):
##D check_resid(m1, split_pred="AR.start")
##D 
##D # Define larger plot window (choose which line you need):
##D dev.new(width=8, height=8) # on windows or mac
##D quartz(,8,8)               # on mac
##D x11(width=8, height=8)     # on linux or mac
##D 
##D par(mfrow=c(2,2), cex=1.1)
##D check_resid(m1, split_pred="AR.start", ask=FALSE)
## End(Not run)




