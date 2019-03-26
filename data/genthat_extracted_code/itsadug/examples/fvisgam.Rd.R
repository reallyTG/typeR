library(itsadug)


### Name: fvisgam
### Title: Visualization of nonlinear interactions, summed effects.
### Aliases: fvisgam

### ** Examples

data(simdat)

## Not run: 
##D # Model with random effect and interactions:
##D m1 <- bam(Y ~ te(Time, Trial)+s(Time, Subject, bs='fs', m=1),
##D     data=simdat, discrete=TRUE)
##D 
##D # Plot summed effects:
##D vis.gam(m1, view=c("Time", "Trial"), plot.type='contour', color='topo')
##D # Same plot:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=FALSE)
##D # Without random effects included:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE)
##D 
##D # Notes on the color legend:
##D # Labels can easily fall off the plot, therefore the numbers can be
##D # automatically rounded.
##D # To do the rounding, set dec=-1:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D      dec=-1)
##D # For custom rounding, set dec to a value:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D      dec=0)
##D # To increase the left marging of the plot (so that the numbers fit):
##D oldmar <- par()$mar
##D par(mar=oldmar + c(0,0,0,1) ) # add one line to the right
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D      dec=3)
##D par(mar=oldmar) # restore to default settings
##D 
##D # changing the color palette:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D     color="terrain")
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D     color=c("blue", "white", "red"), col=1)
##D 
##D # Using transform
##D # Plot log-transformed dependent predictor on measurement scale:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE, transform=exp)
##D 
##D # Notes on transform.view: 
##D # This will generate an error, because x-values <= 0 will result in NaN:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D    transform.view=list(log, NULL))
##D # adjusting the x-axis helps:
##D fvisgam(m1, view=c("Time", "Trial"), rm.ranef=TRUE,
##D    xlim=c(1,2000), transform.view=list(log, NULL))
##D 
## End(Not run)
# see the vignette for examples:
vignette("inspect", package="itsadug")



