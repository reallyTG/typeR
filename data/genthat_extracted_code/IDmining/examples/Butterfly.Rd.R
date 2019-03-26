library(IDmining)


### Name: Butterfly
### Title: Butterfly Data Set Generator
### Aliases: Butterfly

### ** Examples

bf <- Butterfly(1000)

## Not run: 
##D require(colorRamps)
##D require(rgl)
##D 
##D c <- cut(bf$Y,breaks=64)
##D cols <- matlab.like(64)[as.numeric(c)]
##D 
##D plot3d(bf$X1,bf$X2,bf$Y,col=cols,radius=0.10,type="s",
##D        xlab="",ylab="",zlab="",box=F)
##D axes3d(lwd=3,cex.axis=3)
##D grid3d(c("x+","y-","z"),col="black",lwd=1)
## End(Not run)



