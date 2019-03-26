library(EstSimPDMP)


### Name: HR
### Title: Estimator of the hazard rate function by a kernel method
### Aliases: HR

### ** Examples

# HR

# Simulation of 50 independent exponential random variables
dat<-rexp(50,1)

# Estimation of the exponential hazard rate at time 0.4
HR(dat,0.4)



