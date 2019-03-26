library(CircNNTSR)


### Name: mnntsplotwithmarginals
### Title: Plots a MNNTS bivariate density together with the marginals
### Aliases: mnntsplotwithmarginals

### ** Examples

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est
cest<-est$cestimates
mnntsplotwithmarginals(cest, M)



