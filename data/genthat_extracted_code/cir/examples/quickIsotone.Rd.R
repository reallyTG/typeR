library(cir)


### Name: quickIsotone
### Title: One-Stop-shop Forward point and interval estimation via CIR or
###   IR
### Aliases: quickIsotone

### ** Examples

# Interesting run (#664) from a simulated up-and-down ensemble:
# (x will be auto-generated as dose levels 1:5)
dat=doseResponse(y=c(1/7,1/8,1/2,1/4,4/17),wt=c(7,24,20,12,17))
# CIR, using the default 'quick' function that also provides CIs (default 90%).
quick1=quickIsotone(dat)
quick1
# Use 'estfun' argument to operate the same function with old PAVA as the estimator
quick0=quickIsotone(dat,estfun=oldPAVA)
quick0

### Showing the data and the fits
par(mar=c(3,3,1,1),mgp=c(2,.5,0),tcl=-0.25)
plot(dat,ylim=c(0.05,0.55),refsize=4,las=1) # uses plot.doseResponse()
# The IR fit: a straightforward interpolation
lines(quick0$y,lty=2) 

# With CIR, 'quickIsotone' cannot show us the true underlying interpolation; 
# it only provides the estimates at requested points.  Interpolation should be done between 
# shrinkage points, not the original design points. So we must call the full 'cirPAVA' function:

slow1=cirPAVA(dat,full=TRUE)
# Now, compare these 3 (the first one is wrong, b/c it interpolates from design points):
midpts=1:4+0.5
approx(1:5,quick1$y,xout=midpts)$y
quickIsotone(dat,outx=midpts) # instead, you can just call 'quickIsotone' and specify 'outx'
approx(slow1$shrinkage$x,slow1$shrinkage$y,xout=midpts)$y # Or use 'cirPAVA'

# Ok... finally plotting the CIR curve
# Both flat intervals are shrunk, because neither are at y=0 or y=1
lines(slow1$shrinkage$x,slow1$shrinkage$y)

# Last but not least, here's the true response function
lines(seq(1,5,0.1),pweibull(seq(1,5,0.1),shape=1.1615,scale=8.4839),col=2)
legend('topleft',pch=c(NA,'X',NA,NA),lty=c(1,NA,2,1),col=c(2,1,1,1),
	legend=c('True Curve','Observations','IR','CIR'),bty='n')



