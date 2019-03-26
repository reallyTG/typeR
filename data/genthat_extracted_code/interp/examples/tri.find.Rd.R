library(interp)


### Name: tri.find
### Title: Locate a point in a triangulation
### Aliases: tri.find
### Keywords: spatial

### ** Examples

data(franke)
tr<-tri.mesh(franke$ds3$x,franke$ds3$y)
plot(tr)
pnt<-list(x=0.3,y=0.4)
triangle.with.pnt<-tri.find(tr,pnt$x,pnt$y)
attach(triangle.with.pnt)
lines(franke$ds3$x[c(i1,i2,i3,i1)],franke$ds3$y[c(i1,i2,i3,i1)],col="red")
points(pnt$x,pnt$y)



