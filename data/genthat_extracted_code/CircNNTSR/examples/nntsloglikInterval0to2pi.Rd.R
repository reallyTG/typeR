library(CircNNTSR)


### Name: nntsloglikInterval0to2pi
### Title: NNTS log-likelihood function for the incidence data defined in
###   the interval [0,2*pi)
### Aliases: nntsloglikInterval0to2pi

### ** Examples

data<-c(2,3,6,4)
cutpoints<-c(0,pi/2,pi,3*pi/2,2*pi-0.00000001)
est<-nntsmanifoldnewtonestimationinterval0to2pi(data,cutpoints,M=1)
cpars<-est$cestimates[,2]
nntsloglikInterval0to2pi(data,cutpoints,cpars,M=1)



