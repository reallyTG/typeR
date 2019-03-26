library(CircNNTSR)


### Name: snntsdensityplot
### Title: Plots a SNNTS density for spherical data
### Aliases: snntsdensityplot

### ** Examples

data(Datab6fisher_ready)
data<-Datab6fisher_ready
M<-c(4,4)
cest<-snntsmanifoldnewtonestimation(data, M)
cpars<-cest$cestimates[,3]
longitud<-seq(0,360,10)*(pi/180)
latitud<-seq(0,180,5)*(pi/180)
z<-outer(longitud,latitud,FUN="snntsdensityplot",cpars,M)
persp(longitud,latitud,z,theta=45,phi=30)
contour(longitud,latitud,z)
points(data[,1],data[,2])



