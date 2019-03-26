library(CircNNTSR)


### Name: nntsDistributioninterval0to2pi
### Title: NNTS distribution function for data defined in the interval
###   [0,2*pi)
### Aliases: nntsDistributioninterval0to2pi

### ** Examples

cpars<-nntsrandominitial(3)
nntsDistributioninterval0to2pi(0, cpars, 3)
nntsDistributioninterval0to2pi(pi, cpars, 3)
nntsDistributioninterval0to2pi(2*pi-0.00000001, cpars, 3)
nntsDistributioninterval0to2pi(2*pi, cpars, 3)
nntsDistributioninterval0to2pi(3*pi, cpars, 3) 


