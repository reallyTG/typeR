library(CircNNTSR)


### Name: mnntsmanifoldnewtonestimation
### Title: Parameter estimation for the MNNTS distributions
### Aliases: mnntsmanifoldnewtonestimation

### ** Examples

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est



