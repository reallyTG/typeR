library(itsadug)


### Name: resid_gam
### Title: Extract model residuals and remove the autocorrelation accounted
###   for.
### Aliases: resid_gam resid.gam

### ** Examples

data(simdat)

## Not run: 
##D # Add start event column:
##D simdat <- start_event(simdat, event=c("Subject", "Trial"))
##D head(simdat)
##D # bam model with AR1 model (toy example, not serious model):
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group), 
##D    data=simdat, rho=.5, AR.start=simdat$start.event)
##D # Standard residuals:
##D res1 <- resid(m1)
##D # Corrected residuals:
##D res2 <- resid_gam(m1)
##D 
##D # Result in different ACF's:
##D par(mfrow=c(1,2))
##D acf(res1)
##D acf(res2)
##D 
##D # Without AR.start included in the model:
##D m2 <- bam(Y ~ Group + te(Time, Trial, by=Group), 
##D    data=simdat)
##D acf(resid_gam(m2), plot=F)
##D # Same as resid(m2)!
##D acf(resid(m2), plot=F)
##D 
##D ### MISSING VALUES ###
##D # Note that corrected residuals cannot be calculated for the last 
##D # point of each time series. These missing values are by default
##D # excluded.
##D 
##D # Therefore, this will result in an error...
##D simdat$res <- resid_gam(m1)
##D # ... and this will give an error too:
##D simdat$res <- NA
##D simdat[!is.na(simdat$Y),] <- resid_gam(m1)
##D # ... but this works:
##D simdat$res <- resid_gam(m1, incl_na=TRUE)
##D 
##D # The parameter incl_na will NOT add missing values
##D # for missing values in the *data*. 
##D # Example:
##D simdat[sample(nrow(simdat), 15),]$Y <- NA
##D # Without AR.start included in the model:
##D m2 <- bam(Y ~ Group + te(Time, Trial, by=Group), 
##D    data=simdat)
##D # This works:
##D acf(resid_gam(m2))
##D # ...but this results in error, although no AR1 model specified:
##D simdat$res <- resid_gam(m2)
##D # ... for this type of missing data, this does not solve the problem:
##D simdat$res <- resid_gam(m2, incl_na=TRUE)
##D # instead try this:
##D simdat$res <- NA
##D simdat[-missing_est(m2),]$res <- resid_gam(m2)
##D 
##D # With AR.start included in the model:
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group), 
##D    data=simdat, rho=.5, AR.start=simdat$start.event)
##D # This works (incl_na=TRUE):
##D simdat$res <- NA
##D simdat[-missing_est(m2),]$res <- resid_gam(m2, incl_na=TRUE)
##D 
## End(Not run)



