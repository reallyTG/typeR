library(iSDM)


### Name: eSample
### Title: R function to perform environmental systematic sampling
### Aliases: eSample

### ** Examples

## Not run: 
##D library(raster)
##D envData<-getData('worldclim', var='bio', res=10)
##D envData<-crop(envData,extent(-10,45,20,75))
##D plot(envData)
##D par(mfrow=c(1,2))
##D Mysampling1<-eSample(envData,nExpect=50,plot=TRUE,
##D saveShape=TRUE,nf=2,lowerLim=0.00001,upperLim=0.99999)
##D plot(envData[[1]])
##D plot(Mysampling1[[1]],add=TRUE,col=2,pch=19)
##D par(mfrow=c(1,2))
##D Mysampling2<-eSample(envData,nExpect=50,plot=TRUE,
##D saveShape=TRUE,nf=2,lowerLim=0.1,upperLim=0.9)
##D plot(envData[[1]])
##D plot(Mysampling2[[1]],add=TRUE,col=2,pch=19)
##D Mysampling3<-eSample(envData,nExpect=50,plot=TRUE,
##D saveShape=TRUE,nf=3,lowerLim=0.001,upperLim=0.999)
##D plot(envData[[1]])
##D plot(Mysampling3[[1]],add=TRUE,col=2)
## End(Not run)



