library(itsadug)


### Name: plot_modelfit
### Title: Visualization of the model fit for time series data.
### Aliases: plot_modelfit

### ** Examples

data(simdat)

# Create grouping predictor for time series:
simdat$Event <- interaction(simdat$Subject, simdat$Trial)

# model without random effects:
m1 <- bam(Y ~ te(Time, Trial),
    data=simdat)
plot_modelfit(m1, view="Time", event=simdat$Event)

# colorizing residuals:
plot_modelfit(m1, view="Time", event=simdat$Event, fill=TRUE)

# All trials of one subject:
## Not run: 
##D # this produces error:
##D plot_modelfit(m1, view="Time", event=simdat$Event, 
##D     cond=list(Subject="a01"), n=-1)
## End(Not run)
# instead try this:
simdat$Subj <- ifelse(simdat$Subject=="a01", TRUE, FALSE)
plot_modelfit(m1, view="Time", event=simdat$Event, 
    cond=list(Subject=simdat$Subj), n=-1)

## Not run: 
##D # Model with random intercepts for subjects:
##D m2 <- bam(Y ~ te(Time, Trial)+s(Subject, bs='re'),
##D     data=simdat)
##D # now selecting a subject works, because it is in the model:
##D plot_modelfit(m2, view="Time", event=simdat$Event, 
##D     cond=list(Subject="a01"), n=-1, ylim=c(-13,13))
##D 
##D # Model with random effect and interactions:
##D m3 <- bam(Y ~ te(Time, Trial)+s(Time, Subject, bs='fs', m=1),
##D     data=simdat)
##D plot_modelfit(m3, view="Time", event=simdat$Event, 
##D     cond=list(Subject="a01"), n=-1, ylim=c(-13,13))
## End(Not run)



