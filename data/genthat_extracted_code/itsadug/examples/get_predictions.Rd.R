library(itsadug)


### Name: get_predictions
### Title: Get model predictions for specific conditions.
### Aliases: get_predictions

### ** Examples

data(simdat)

## Not run: 
##D m1 <- bam(Y ~ Group + s(Time, by=Group), data=simdat)
##D 
##D # Time value is automatically set:
##D pp <- get_predictions(m1, cond=list(Group="Adults"))
##D head(pp)
##D 
##D # Range of time values:
##D pp <- get_predictions(m1, 
##D     cond=list(Group="Adults", Time=seq(0,500,length=100)))
##D # plot:
##D emptyPlot(500, range(pp$fit), h=0)
##D plot_error(pp$Time, pp$fit, pp$CI, shade=TRUE, xpd=TRUE)
##D 
##D # Warning: also unrealistical values are possible
##D range(simdat$Time)
##D pp <- get_predictions(m1, 
##D     cond=list(Group="Adults", Time=seq(-500,0,length=100)))
##D # plot of predictions that are not supported by data:
##D emptyPlot(c(-500,0), range(pp$fit), h=0)
##D plot_error(pp$Time, pp$fit, pp$CI, shade=TRUE, xpd=TRUE) 
##D 
##D m2 <- bam(Y ~ Group + s(Time, by=Group)
##D     + s(Time, Subject, bs='fs', m=1), 
##D     data=simdat, discrete=TRUE)
##D # Simultaneous CI vs pointwise CI
##D # NOTE: USE AT LEST 200 DATAPOINTS FOR SIMULTANEOUS CI
##D pp <- get_predictions(m2, 
##D     cond=list(Group="Adults", Time=seq(0,2000,length=200)), 
##D     rm.ranef=TRUE, sim.ci=TRUE)
##D head(pp)
##D # plot:
##D emptyPlot(2000, range(pp$fit), h=0)
##D plot_error(pp$Time, pp$fit, pp$CI, shade=TRUE, xpd=TRUE)
##D plot_error(pp$Time, pp$fit, pp$sim.CI, shade=FALSE, col=2, xpd=TRUE)
##D 
##D 
## End(Not run)




