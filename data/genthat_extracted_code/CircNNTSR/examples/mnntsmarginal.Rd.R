library(CircNNTSR)


### Name: mnntsmarginal
### Title: Marginal density function of the MNNTS model
### Aliases: mnntsmarginal

### ** Examples

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est
cest<-est$cestimates
mnntsmarginal(cest,M,1,pi)



