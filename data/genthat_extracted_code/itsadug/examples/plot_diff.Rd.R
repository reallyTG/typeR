library(itsadug)


### Name: plot_diff
### Title: Plot difference curve based on model predictions.
### Aliases: plot_diff plotDiff

### ** Examples

data(simdat)
## Not run: 
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group)
##D     + s(Time, Subject, bs='fs', m=1),
##D     data=simdat, discrete=TRUE)
##D plot_diff(m1, view='Time', comp=list(Group=c("Children", "Adults")))
##D # in this model, excluding random effects does not change the difference:
##D plot_diff(m1, view='Time', comp=list(Group=c("Children", "Adults")), 
##D     rm.ranef=TRUE)
##D # simultaneous CI:
##D plot_diff(m1, view='Time', comp=list(Group=c("Children", "Adults")), 
##D     rm.ranef=TRUE, sim.ci=TRUE)
##D # Reversed y-axis (for EEG data) and no shading:
##D plot_diff(m1, view='Time', comp=list(Group=c("Children", "Adults")), 
##D     eegAxis=TRUE, shade=FALSE)
##D plot_diff(m1, view='Time', comp=list(Group=c("Children", "Adults")),
##D density=15, angle=90, ci.lwd=3)
##D # Retrieving plot values...
##D out <- plot_diff(m1, view='Time', comp=list(Group=c("Children", "Adults")), 
##D    plot=FALSE)
##D #... which might be used for indicating differences:
##D x <- find_difference(out$est, out$se, f=1.96, xVals=out$xVals)
##D # add lines:
##D arrows(x0=x$start, x1=x$end, y0=0, y1=0,code=3, length=.1, col='red')
## End(Not run)




