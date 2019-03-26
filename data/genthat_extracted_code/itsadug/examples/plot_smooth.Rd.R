library(itsadug)


### Name: plot_smooth
### Title: Visualization of smooths.
### Aliases: plot_smooth

### ** Examples

data(simdat)

## Not run: 
##D # Model with random effect and interactions:
##D m1 <- bam(Y ~ te(Time, Trial)+s(Time, Subject, bs='fs', m=1),
##D     data=simdat, discrete=TRUE)
##D 
##D # Default plot produces only surface of Time x Trial:
##D plot(m1, select=1)
##D # Only the Time component:
##D plot_smooth(m1, view="Time")
##D # Note the summary that is printed.
##D 
##D # without random effects:
##D plot_smooth(m1, view="Time", rm.ranef=TRUE)
##D 
##D # Plot summed effects:
##D dev.new(width=8, height=4) # use x11(,8,4) on Linux
##D par(mfrow=c(1,2))
##D fvisgam(m1, view=c("Time", "Trial"), 
##D     plot.type='contour', color='topo', main='interaction',
##D     rm.ranef=TRUE)
##D arrows(x0=0, x1=2200, y0=-5, y1=-5, col='red', 
##D     code=2, length=.1, lwd=2, xpd=TRUE)
##D plot_smooth(m1, view='Time', cond=list(Trial=-5),
##D     main='Trial=-5', rm.ranef=TRUE)
##D 
##D 
##D # Model with random effect and interactions:
##D m2 <- bam(Y ~ Group + s(Time, by=Group)
##D     +s(Time, Subject, bs='fs', m=1),
##D     data=simdat, discrete=TRUE)
##D 
##D # Plot all levels of a predictor:
##D plot_smooth(m2, view='Time', plot_all="Group",
##D     rm.ranef=TRUE)
##D # It also possible to combine predictors in plot_all.
##D # Note: this is not a meaningfull plot, because Subjects
##D # fall in only one group. Just for illustration purposes!
##D plot_smooth(m2, view='Time', plot_all=c("Group", "Subject"))
##D # Clearly visible difference in confidence interval, because  
##D # a01 does not occur in Group "Children":
##D # (Note that this plot generates warning)
##D plot_smooth(m2, view='Time', plot_all=c("Group", "Subject"), cond=list(Subject="a01"))
##D 
##D # Using sim.ci: simultaneous CI instead of pointwise CI
##D dev.new(width=8, height=4) # use x11(,8,4) on Linux
##D par(mfrow=c(1,2))
##D plot_smooth(m2, view='Time', plot_all="Group", rm.ranef=TRUE)
##D plot_smooth(m2, view='Time', rm.ranef=TRUE, plot_all="Group", sim.ci=TRUE, 
##D     add=TRUE, shade=FALSE, xpd=TRUE)
##D plot_smooth(m2, view='Time', rm.ranef=TRUE, sim.ci=TRUE, col='red')
##D 
##D 
##D 
##D # Using transform
##D # Plot log-transformed dependent predictor on original scale:
##D plot_smooth(m1, view="Time", rm.ranef=TRUE, transform=exp)
##D 
##D # Notes on transform.view: 
##D # This will generate an error, because x-values <= 0 will result in NaN:
##D plot_smooth(m1, view="Time", rm.ranef=TRUE, transform.view=log)
##D # adjusting the x-axis helps:
##D plot_smooth(m1, view="Time", rm.ranef=TRUE, transform.view=log,
##D    xlim=c(1,2000))
##D 
## End(Not run)

# and for a quick overview of plotfunctions:
vignette("overview", package="itsadug")




