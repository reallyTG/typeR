library(EstSimPDMP)


### Name: plotHR
### Title: Plot the estimator of the hazard rate computed by the function
###   HR
### Aliases: plotHR

### ** Examples

# plotHR

# Simulation of 100 independent exponential random variables
dat<-rexp(100,1)

# Estimation of the exponential hazard rate between 0 and 2
plotHR(dat,1,2,100,h=0.2)

# Theoretical hazard rate of exponential distribution
points(1:2,c(1,1),col="blue",type="l")



