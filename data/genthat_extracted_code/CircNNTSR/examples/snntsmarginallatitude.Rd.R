library(CircNNTSR)


### Name: snntsmarginallatitude
### Title: Marginal density function for latitude of the SNNTS model for
###   spherical data
### Aliases: snntsmarginallatitude

### ** Examples

data(Datab6fisher_ready)
data<-Datab6fisher_ready
M<-c(1,2)
cest<-snntsmanifoldnewtonestimation(data, M)
lat<-snntsmarginallatitude(seq(0,pi,.1),cest$cestimates[,3],M)
plot(seq(0,pi,.1),lat,type="l")



