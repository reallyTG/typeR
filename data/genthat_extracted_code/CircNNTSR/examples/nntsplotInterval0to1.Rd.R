library(CircNNTSR)


### Name: nntsplotInterval0to1
### Title: Plots an NNTS density for a variable defined in the interval
###   [0,1)
### Aliases: nntsplotInterval0to1

### ** Examples

data<-c(1,2,4,6,2)
cutpoints<-c(0,0.2,0.4,0.6,0.8,0.9999999)
est<-nntsmanifoldnewtonestimationinterval0to1(data,cutpoints,5,1)
cpars<-est$cestimates[,2]
nntsplotInterval0to1(cpars, 1)



