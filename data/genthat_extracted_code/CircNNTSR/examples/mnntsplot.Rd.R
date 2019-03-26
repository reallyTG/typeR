library(CircNNTSR)


### Name: mnntsplot
### Title: Plots a MNNTS bivariate density
### Aliases: mnntsplot

### ** Examples

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est
cest<-est$cestimates
mnntsplot(cest, M)



