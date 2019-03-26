library(SPODT)


### Name: dataBALL0
### Title: Example data file
### Aliases: dataBALL0
### Keywords: datasets

### ** Examples

data(dataBALL0)
dataset<-dataBALL0
coordinates(dataset)<-c("x","y")
#coordinates are planar ones
#Example : split the area without covariable analysis
sp<-spodt(dataset@data$z~1, dataset, weight=FALSE, graft=0.2)

ssp<-spodtSpatialLines(sp,dataset)
plot(ssp)
points(dataset,cex=dataset@data$z)




