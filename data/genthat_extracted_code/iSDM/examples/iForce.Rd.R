library(iSDM)


### Name: iForce
### Title: R function to compute a negative exponential dispersal kernel
### Aliases: iForce

### ** Examples

## Not run: 
##D library(raster)
##D library(sp)
##D envData<-getData('worldclim', var='bio', res=10)
##D envData<-crop(envData,extent(-8,15,38,55))
##D envData<-envData[[1]]
##D 
##D #Generate randomly a SpatilaPointsDataFrame containing occurrences
##D xy<-coordinates(envData)[sample(which(is.na(values(envData))==FALSE),100),]
##D occ<-ifelse(xy[,2]>50,0,1)
##D occData<-SpatialPointsDataFrame(coords=xy,data=as.data.frame(occ), 
##D proj4string = CRS(proj4string(envData)))
##D 
##D par(mfrow=c(3,3),mar=c(1.5,1.5,1.5,1.5))
##D for (a in c(0.01,0.03,0.05,0.06,0.09,0.1,0.3,0.6,0.9)){
##D propagule<-iForce(occData,envData=envData,a=a,binary=TRUE,longlat=TRUE)
##D plot(propagule,main=paste("a = ",a))
##D plot(occData,col=ifelse(occData@data[,1]==1,1,0),add=TRUE,cex=0.3)}
## End(Not run)



