library(SPODT)


### Name: dataSQUARE0
### Title: Example data file
### Aliases: dataSQUARE0
### Keywords: datasets

### ** Examples

data(dataSQUARE0)
dataset<-dataSQUARE0
coordinates(dataset)<-c("x","y")
#coordinates are planar ones
#Example : split the area without covariable analysis
sp<-spodt(dataset@data$z~1, dataset, weight=FALSE, graft=0.2)

ssp<-spodtSpatialLines(sp,dataset)
plot(ssp)
points(dataset,cex=dataset@data$z)

#the warning "root is a leaf" tells that no split can be provided by the
    #spodt function according to the splitting parameters



