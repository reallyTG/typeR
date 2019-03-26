library(SFtools)


### Name: Infinity
### Title: Simulated dataset
### Aliases: Infinity

### ** Examples

infinity<-Infinity(n=1000)
plot(infinity$x1,infinity$x2)

## Not run: 
##D 
##D #### Visualisation of the infinity dataset (3D) ####
##D require(rgl)
##D require(colorRamps)
##D 
##D c <- cut(infinity$z,breaks=100)
##D cols <- matlab.like(100)[as.numeric(c)]
##D plot3d(infinity$x1,infinity$x2,infinity$z,radius=0.01, col=cols,
##D type="s",xlab="x1",ylab="x2",zlab="z",box=F)
##D grid3d(c("x","y","z"),col="black",lwd=1)
##D 
## End(Not run)



