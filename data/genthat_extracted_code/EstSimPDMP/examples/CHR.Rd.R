library(EstSimPDMP)


### Name: CHR
### Title: Nelson-Aalen estimator
### Aliases: CHR

### ** Examples

# CHR

# Simulation of 50 independent exponential random variables
dat<-rexp(50,1)

# Nelson-Aalen estimator of cumulative hazard rate at time 2
CHR(dat,2)



