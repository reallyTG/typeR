library(itsadug)


### Name: pvisgam
### Title: Visualization of partial nonlinear interactions.
### Aliases: pvisgam

### ** Examples

data(simdat)

## Not run: 
##D # Model with random effect and interactions:
##D m1 <- bam(Y ~ te(Time, Trial)+s(Time, Subject, bs='fs', m=1),
##D     data=simdat, discrete=TRUE)
##D 
##D # Plot summed effects:
##D vis.gam(m1, view=c("Time", "Trial"), plot.type='contour', color='topo')
##D # Partial effect of interaction:
##D pvisgam(m1, view=c("Time", "Trial"), select=1)
##D # Same:
##D plot(m1, select=1, scheme=2)
##D plot(m1, select=1)
##D # Alternatives:
##D pvisgam(m1, view=c("Trial", "Time"), select=1)
##D pvisgam(m1, view=c("Trial", "Time"), select=1, zlim=c(-20,20))
##D pvisgam(m1, view=c("Trial", "Time"), select=1, zlim=c(-20,20), 
##D     color="terrain")
##D pvisgam(m1, view=c("Trial", "Time"), select=1, zlim=c(-20,20), 
##D     color=c("blue", "white", "red"))
##D 
##D # Notes on the color legend:
##D # Labels can easily fall off the plot, therefore the numbers are 
##D # automatically rounded.
##D # To undo the rounding, set dec=NULL:
##D pvisgam(m1, view=c("Time", "Trial"), dec=NULL)
##D # For custom rounding, set dec to a value:
##D pvisgam(m1, view=c("Time", "Trial"), dec=3)
##D # To increase the left marging of the plot (so that the numbers fit):
##D oldmar <- par()$mar
##D par(mar=oldmar + c(0,0,0,1) ) # add one line to the right
##D pvisgam(m1, view=c("Time", "Trial"), dec=3)
##D par(mar=oldmar) # restore to default settings
##D 
## End(Not run)
# see the vignette for examples:
vignette("overview", package="itsadug")



