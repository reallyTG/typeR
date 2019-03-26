library(itsadug)


### Name: plot_data
### Title: Visualization of the model fit for time series data.
### Aliases: plot_data

### ** Examples

data(simdat)

## Not run: 
##D # Create grouping predictor for time series:
##D simdat$Event <- interaction(simdat$Subject, simdat$Trial)
##D 
##D # model without random effects:
##D m1 <- bam(Y ~ te(Time, Trial) + s(Subject, bs='re'),
##D     data=simdat)
##D 
##D # All data points, without clustering:
##D plot_data(m1, view="Time")
##D 
##D # All data, clustered by Trial (very small dots):
##D plot_data(m1, view="Time", split_by="Trial",
##D     cex=.25)
##D # Add a smooth for each trial:
##D plot_smooth(m1, view="Time", plot_all="Trial", 
##D     add=TRUE, rm.ranef=TRUE)
##D # Add the model predictions in same color:
##D plot_smooth(m1, view="Time", plot_all="Trial", add=TRUE, rm.ranef=TRUE)
##D 
##D # Alternatively, use data to select events:
##D plot_data(m1, view="Time", split_by=list(Event=simdat$Event),
##D     type='l')
##D # which is the same as:
##D plot_data(m1, view="Time", split_by=list(Subject=simdat$Subject, Trial=simdat$Trial),
##D     type='l')
##D # Only for Trial=0
##D plot_data(m1, view="Time", split_by=list(Event=simdat$Event),
##D    cond=list(Trial=0), type='l')
##D # This is the same:
##D plot_data(m1, view="Time", split_by="Subject",
##D    cond=list(Trial=0), type='l')
##D # Add subject smooths:
##D plot_smooth(m1, view="Time", plot_all="Subject", 
##D     cond=list(Trial=0), add=TRUE)
##D 
##D # Change the colors:
##D plot_data(m1, view="Time", split_by="Subject",
##D    cond=list(Trial=0), type='l', col='gray', alpha=1)
## End(Not run)




