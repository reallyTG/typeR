library(CircNNTSR)


### Name: nntsmanifoldnewtonestimationinterval0to2pi
### Title: Parameter estimation for grouped data defined in [0,2*pi)
### Aliases: nntsmanifoldnewtonestimationinterval0to2pi

### ** Examples

data<-c(1,2,6,4)
cutpoints<-c(0,pi/2,pi,3*pi/2,2*pi-0.00000001)
nntsmanifoldnewtonestimationinterval0to2pi(data, cutpoints, length(data),1)



