library(iSDM)


### Name: pDLA
### Title: R function to compute the probability of detecting
###   dispersal-limited absences within a network of presence-absence data
### Aliases: pDLA

### ** Examples

## Not run: 
##D library(raster)
##D library(sp)
##D library(virtualspecies)
##D library(colorRamps)
##D 
##D envData<-getData('worldclim', var='bio', res=10)
##D envData<-crop(envData,extent(-8,15,38,55))
##D 
##D #Generate virtual species responses with formatfunctions 
##D my.parameters <- formatFunctions(bio1 = c(fun = "dnorm", mean = 140, sd = 40),
##D bio5 = c(fun = "dnorm",mean = 230, sd = 70),
##D bio6 = c(fun = "dnorm",mean = 10, sd = 40))
##D 
##D #Generate a virtual species distributions with responses to environmental variables
##D potential.dist <- generateSpFromFun(envData[[c(1,5,6)]], my.parameters)
##D 
##D #Limit a virtual species distribution to a defined area. 
##D #It will thus generate a species which is not at the equilibrium with its environment
##D realized.dist<-limitDistribution(x=potential.dist$suitab.raster, area=extent(-8,15,38,48))
##D 
##D #Generate a random presence absence dataset from the realized distribution 
##D # using a probability threshold of 0.5
##D Presence<-coordinates(realized.dist$occupied.area
##D )[sample(which(values(realized.dist$occupied.area)>0.5),300),]
##D Absence<-coordinates(realized.dist$occupied.area
##D )[sample(which(values(realized.dist$occupied.area)<0.5),300),]
##D occData<-as.data.frame(rbind(cbind(Presence,SP=rep(1,300)),cbind(Absence,SP=rep(0,300))))
##D coordinates(occData)<-~x+y
##D proj4string(occData)<-proj4string(envData)
##D 
##D # Calculat  the probability of detecting dispersal-limited absences
##D probability<-pDLA(occData=occData,envData=envData[[c(1,5,6)]],longlat=TRUE)
##D 
##D # Display the results
##D par(mfrow=c(1,2),mar=c(2,2.5,2,2.5))
##D plot(realized.dist$occupied.area,main="Realized distribution")
##D plot(occData,col=ifelse(occData$SP==1,2,1),add=TRUE,pch=19,cex=0.8)
##D plot(potential.dist$suitab.raster,main="Potential distribution")
##D 
##D scatterCol<-function(x){
##D x<-(x-min(x))/(max(x)-min(x))
##D colorFunction <- colorRamp(matlab.like(100))
##D zMatrix <- colorFunction(x)
##D zColors <- rgb(zMatrix[,1], zMatrix[,2], zMatrix[,3], maxColorValue=255)
##D return(zColors)}
##D points(probability,pch=21, col=1,bg=scatterCol(probability@data[,"PDLA"]),cex=1)
##D # Example based on occurrences from both the invaded and the native range 
##D envData<-getData('worldclim', var='bio', res=10)
##D envNative<-crop(envData,extent(-90,-70,20,40))
##D envData<-crop(envData,extent(-8,15,38,55))
##D native.dist <- generateSpFromFun(envNative[[c(1,5,6)]], my.parameters)
##D occNative<-as.data.frame(coordinates(native.dist$suitab.raster)
##D [sample(which(values(native.dist$suitab.raster)>0.5),100),])
##D coordinates(occNative)<-~x+y
##D proj4string(occNative)<-proj4string(envData)
##D plot(native.dist,main=" Native range distribution")
##D plot(occNative,add=TRUE,pch=19,cex=0.8)
##D probability<-pDLA(occData=occData,envData=envData[[c(1,5,6)]],longlat=TRUE,
##D occNative=occNative,envNative=envNative[[c(1,5,6)]])
## End(Not run)



