library(tbart)


### Name: allocate
### Title: Teitz-Bart algorithm applied to Spatial* and Spatial*DataFrame
###   objects
### Aliases: allocate

### ** Examples

data(meuse)
coordinates(meuse) <- ~x+y
allocate(meuse,p=5)



require(RColorBrewer)
require(GISTools)
data(georgia)
allocations.list <- allocate(georgia2,p=5)
zones <- gUnaryUnion(georgia2,allocations.list)
plot(zones,col=brewer.pal(5,"Accent"))
plot(georgia2,border=rgb(0,0,0,0.1),add=TRUE)
points(coordinates(georgia2)[allocations.list,],pch=16,cex=2,col=rgb(1,0.5,0.5,0.1))



