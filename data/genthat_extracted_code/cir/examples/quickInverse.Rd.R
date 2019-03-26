library(cir)


### Name: quickInverse
### Title: Point and Interval Inverse Estimation ("Dose-Finding"), using
###   CIR and IR
### Aliases: quickInverse

### ** Examples

# Interesting run (#664) from a simulated up-and-down ensemble:
# (x will be auto-generated as dose levels 1:5)
dat=doseResponse(y=c(1/7,1/8,1/2,1/4,4/17),wt=c(7,24,20,12,17))
# The experiment's goal is to find the 30th percentile
inv1=quickInverse(dat,target=0.3)
# With old PAVA as the forward estimator:
inv0=quickInverse(dat,target=0.3,estfun=oldPAVA)


### Showing the data and the estimates
par(mar=c(3,3,1,1),mgp=c(2,.5,0),tcl=-0.25)
plot(dat,ylim=c(0.05,0.55),refsize=4,las=1) # uses plot.doseResponse()

# The true response function; true target is where it crosses the y=0.3 line
lines(seq(1,5,0.1),pweibull(seq(1,5,0.1),shape=1.1615,scale=8.4839),col=4)
abline(h=0.3,col=2,lty=3)
# Plotting the point estimates, as "tick" marks on the y=0.3 line
lines(rep(inv1$point,2),c(0.25,0.35)) # CIR
lines(rep(inv0$point,2),c(0.25,0.35),lty=2) # IR
# You could plot the CIs too, but they are very broad and much more similar than the 
# point estimates. The broadness likely reflects the shallow slope, which itself reflects the 
# monotonicity violations.
# Here's code to plot the CIR 90% CI as a light-green rectangle:
# rect(inv1$lower90conf,0.25,inv1$upper90conf,0.35,col=rgb(0,1,0,alpha=0.3),border=NA)

legend('topleft',pch=c(NA,'X',NA,NA),lty=c(1,NA,2,1),col=c(4,1,1,1),
	legend=c('True Curve','Observations','IR Estimate','CIR Estimate'),bty='n')




