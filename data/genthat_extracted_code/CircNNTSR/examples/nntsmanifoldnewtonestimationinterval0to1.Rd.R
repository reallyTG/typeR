library(CircNNTSR)


### Name: nntsmanifoldnewtonestimationinterval0to1
### Title: Parameter estimation for grouped data defined in [0,1)
### Aliases: nntsmanifoldnewtonestimationinterval0to1

### ** Examples

data<-c(1,2,4,6,1)
cutpoints<-c(0,0.2,0.4,0.6,0.8,0.999999999)
nntsmanifoldnewtonestimationinterval0to1(data, cutpoints, length(data), 1)



