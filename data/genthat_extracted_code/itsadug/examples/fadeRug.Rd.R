library(itsadug)


### Name: fadeRug
### Title: Fade out the areas in a surface without data.
### Aliases: fadeRug

### ** Examples

data(simdat)

# Introduce extreme values:
set.seed(123)
newdat <- simdat[sample(which(simdat$Time < 1500),
    size=round(.5*length(which(simdat$Time < 1500)))),]
newdat <- rbind(newdat, 
    simdat[sample(which(simdat$Time > 1500),
    size=5),])
# Some simple GAM with tensor:
m1 <- bam(Y ~ te(Time, Trial), data=newdat)
# plot summed effects:
fvisgam(m1, view=c("Time", "Trial"), zlim=c(-15,15))
fadeRug(newdat$Time, newdat$Trial)
# check with data points:
points(newdat$Time, newdat$Trial, pch=16, col=alpha(1))

# compare with default rug:
fvisgam(m1, view=c("Time", "Trial"), zlim=c(-15,15))
rug(newdat$Time)
rug(newdat$Trial, side=2)
fadeRug(newdat$Time, newdat$Trial)
# and compare with too.far:
fvisgam(m1, view=c("Time", "Trial"), zlim=c(-15,15),
    too.far=.03)
vis.gam(m1, view=c("Time", "Trial"), zlim=c(-15,15),
    too.far=.03, plot.type="contour", color="topo")

# in case fade rug overlaps with color legend:
fvisgam(m1, view=c("Time", "Trial"), zlim=c(-15,15),
     add.color.legend=FALSE)
fadeRug(newdat$Time, newdat$Trial, alpha=.75)
gradientLegend(c(-15,15), pos=.875)

# change x- and y-grid, and color:
fvisgam(m1, view=c("Time", "Trial"), zlim=c(-15,15))
points(newdat$Time, newdat$Trial)
fadeRug(newdat$Time, newdat$Trial, n.grid=c(100,10), col='gray')



