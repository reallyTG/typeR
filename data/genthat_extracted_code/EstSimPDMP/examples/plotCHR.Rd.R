library(EstSimPDMP)


### Name: plotCHR
### Title: Plot the Nelson-Aalen estimator
### Aliases: plotCHR

### ** Examples

# plotCHR

# Simulation of 50 independent exponential random variables
dat<-rexp(50,1)

# Nelson-Aalen estimator of cumulative hazard rate between 0 and 2
plotCHR(dat,0,2,20)

# Theoretical cumulative hazard rate
points(0:2,0:2,col="blue",type="l")



