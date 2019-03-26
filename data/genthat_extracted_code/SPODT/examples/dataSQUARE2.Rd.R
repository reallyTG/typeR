library(SPODT)


### Name: dataSQUARE2
### Title: Example data file
### Aliases: dataSQUARE2
### Keywords: datasets

### ** Examples

data(dataSQUARE2)
dataset<-dataSQUARE2
coordinates(dataset)<-c("x","y")
#coordinates are planar ones
#Example : split the area without covariable analysis
sp<-spodt(dataset@data$z~1, dataset, weight=FALSE, graft=0.2)

ssp<-spodtSpatialLines(sp,dataset)
plot(ssp)
points(dataset,cex=dataset@data$z)




