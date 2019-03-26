library(CircNNTSR)


### Name: mnntsplotmarginal
### Title: Plots a MNNTS marginal density
### Aliases: mnntsplotmarginal

### ** Examples

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est
cest<-est$cestimates
mnntsplotmarginal(cest, M, 1)
mnntsplotmarginal(cest, M, 2)



