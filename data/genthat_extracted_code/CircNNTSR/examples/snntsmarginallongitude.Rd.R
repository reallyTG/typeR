library(CircNNTSR)


### Name: snntsmarginallongitude
### Title: Marginal density function for the longitude of the SNNTS model
###   for spherical data
### Aliases: snntsmarginallongitude

### ** Examples

data(Datab6fisher_ready)
data<-Datab6fisher_ready
M<-c(1,2)
cest<-snntsmanifoldnewtonestimation(data, M)
long<-snntsmarginallongitude(seq(0,2*pi,.1),cest$cestimates[,3],M)
plot(seq(0,2*pi,.1),long,type="l")



