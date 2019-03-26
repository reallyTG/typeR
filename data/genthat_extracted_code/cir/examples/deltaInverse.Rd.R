library(cir)


### Name: deltaInverse
### Title: Calculate inverse (dose-finding) intervals, using local
###   inversion and the Delta method
### Aliases: deltaInverse

### ** Examples

# Interesting run (#664) from a simulated up-and-down ensemble:
# (x will be auto-generated as dose levels 1:5)
dat=doseResponse(y=c(1/7,1/8,1/2,1/4,4/17),wt=c(7,24,20,12,17))
# The experiment's goal is to find the 30th percentile
quick1=quickIsotone(dat)
invDelta=deltaInverse(dat)

### Showing the data and the estimates
par(mar=c(3,3,4,1),mgp=c(2,.5,0),tcl=-0.25)
# Following command uses plot.doseResponse()
plot(dat,ylim=c(0.05,0.55),refsize=4,las=1,xlim=c(-1,6),main="Inverse-Estimation CIs") 

# The true response function; true target is where it crosses the y=0.3 line
lines(seq(0,7,0.1),pweibull(seq(0,7,0.1),shape=1.1615,scale=8.4839),col=4)
abline(h=0.3,col=2,lty=3) ### The experiment's official target

# Forward CIs; the "global" inverse interval just draws horizontal lines between them
# To get "global" values calculated for you at specific targets, choose 'delta=FALSE' 
# when calling quickInverse()
lines(quick1$lower90conf,lty=2,col=3) 
lines(quick1$upper90conf,lty=2,col=3) 
# Note how for y=0.3, both bounds are infinite (i.e., no intersection with the horizontal line)
# unless one dares to extrapolate outside range of observations.

# Now, the default "local" inverse interval, which is finite for the range of estimated y values.
# In particular, it is finite (albeit very wide) for y=0.3.
lines(invDelta[,1],quick1$y,lty=2)
lines(invDelta[,2],quick1$y,lty=2)

legend('topleft',pch=c(NA,'X',NA,NA),lty=c(1,NA,2,2),col=c(4,1,1,3),legend=
	c('True Curve','Observations','Local Interval (default)','Forward/Global Interval'),bty='n')




