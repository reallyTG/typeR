library(rgeos)


### Name: gBoundary
### Title: Boundary of Geometry
### Aliases: gBoundary RGEOSBoundary
### Keywords: spatial

### ** Examples


x = readWKT("POLYGON((0 0,10 0,10 10,0 10,0 0))")
b = gBoundary(x)

plot(x,col='black')
plot(b,col='red',lwd=3,add=TRUE)

# mod-2 rule example
x1 = readWKT("MULTILINESTRING((2 2,2 0),(2 2,0 2))")
x2 = readWKT("MULTILINESTRING((2 2,2 0),(2 2,0 2),(2 2,4 2))")
x3 = readWKT("MULTILINESTRING((2 2,2 0),(2 2,0 2),(2 2,4 2),(2 2,2 4))")
x4 = readWKT("MULTILINESTRING((2 2,2 0),(2 2,0 2),(2 2,4 2),(2 2,2 4),(2 2,4 4))")

b1 = gBoundary(x1)
b2 = gBoundary(x2)
b3 = gBoundary(x3)
b4 = gBoundary(x4)

par(mfrow=c(2,2))
plot(x1); plot(b1,pch=16,col='red',add=TRUE)
plot(x2); plot(b2,pch=16,col='red',add=TRUE)
plot(x3); plot(b3,pch=16,col='red',add=TRUE)
plot(x4); plot(b4,pch=16,col='red',add=TRUE)




