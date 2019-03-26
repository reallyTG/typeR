library(rgeos)


### Name: gBuffer
### Title: Buffer Geometry
### Aliases: gBuffer RGEOSBuffer
### Keywords: spatial

### ** Examples


p1 = readWKT("POLYGON((0 1,0.95 0.31,0.59 -0.81,-0.59 -0.81,-0.95 0.31,0 1))")
p2 = readWKT("POLYGON((2 2,-2 2,-2 -2,2 -2,2 2),(1 1,-1 1,-1 -1,1 -1,1 1))")

par(mfrow=c(2,3))
plot(gBuffer(p1,width=-0.2),col='black',xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))
plot(p1,border='blue',lwd=2,add=TRUE);title("width: -0.2")
plot(gBuffer(p1,width=0),col='black',xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))
plot(p1,border='blue',lwd=2,add=TRUE);title("width: 0")
plot(gBuffer(p1,width=0.2),col='black',xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))
plot(p1,border='blue',lwd=2,add=TRUE);title("width: 0.2")

plot(gBuffer(p2,width=-0.2),col='black',pbg='white',xlim=c(-2.5,2.5),ylim=c(-2.5,2.5))
plot(p2,border='blue',lwd=2,add=TRUE);title("width: -0.2")
plot(gBuffer(p2,width=0),col='black',pbg='white',xlim=c(-2.5,2.5),ylim=c(-2.5,2.5))
plot(p2,border='blue',lwd=2,add=TRUE);title("width: 0")
plot(gBuffer(p2,width=0.2),col='black',pbg='white',xlim=c(-2.5,2.5),ylim=c(-2.5,2.5))
plot(p2,border='blue',lwd=2,add=TRUE);title("width: 0.2")

p3 <- readWKT(paste("GEOMETRYCOLLECTION(",
 "POLYGON((0 1,0.95 0.31,0.59 -0.81,-0.59 -0.81,-0.95 0.31,0 1)),",
 "POLYGON((2 2,-2 2,-2 -2,2 -2,2 2),(1 1,-1 1,-1 -1,1 -1,1 1)))"))

par(mfrow=c(1,1))
plot(gBuffer(p3, byid=TRUE, width=c(-0.2, -0.1)),col='black',pbg='white',
xlim=c(-2.5,2.5),ylim=c(-2.5,2.5))
plot(p3,border=c('blue', 'red'),lwd=2,add=TRUE);title("width: -0.2, -0.1")
library(sp)
p3df <- SpatialPolygonsDataFrame(p3, data=data.frame(i=1:length(p3),
 row.names=row.names(p3)))
dim(p3df)
row.names(p3df)
dropEmpty = gBuffer(p3df, byid=TRUE, id=letters[1:nrow(p3df)], width=c(-1, 0))
dim(dropEmpty)
row.names(dropEmpty)
row.names(slot(dropEmpty, "data"))
plot(dropEmpty, col='black', pbg='white', xlim=c(-2.5,2.5),ylim=c(-2.5,2.5))
plot(p3df,border=c('blue'),lwd=2,add=TRUE);title("width: -1, 0")
par(mfrow=c(2,3))


#Style options
l1 = readWKT("LINESTRING(0 0,1 5,4 5,5 2,8 2,9 4,4 6.5)")
par(mfrow=c(2,3))
plot(gBuffer(l1,capStyle="ROUND"));plot(l1,col='blue',add=TRUE);title("capStyle: ROUND")
plot(gBuffer(l1,capStyle="FLAT"));plot(l1,col='blue',add=TRUE);title("capStyle: FLAT")
plot(gBuffer(l1,capStyle="SQUARE"));plot(l1,col='blue',add=TRUE);title("capStyle: SQUARE")

plot(gBuffer(l1,quadsegs=1));plot(l1,col='blue',add=TRUE);title("quadsegs: 1")
plot(gBuffer(l1,quadsegs=2));plot(l1,col='blue',add=TRUE);title("quadsegs: 2")
plot(gBuffer(l1,quadsegs=5));plot(l1,col='blue',add=TRUE);title("quadsegs: 5")



l2 = readWKT("LINESTRING(0 0,1 5,3 2)")
par(mfrow=c(2,3))
plot(gBuffer(l2,joinStyle="ROUND"));plot(l2,col='blue',add=TRUE);title("joinStyle: ROUND")
plot(gBuffer(l2,joinStyle="MITRE"));plot(l2,col='blue',add=TRUE);title("joinStyle: MITRE")
plot(gBuffer(l2,joinStyle="BEVEL"));plot(l2,col='blue',add=TRUE);title("joinStyle: BEVEL")

plot(gBuffer(l2,joinStyle="MITRE",mitreLimit=0.5));plot(l2,col='blue',add=TRUE)
 title("mitreLimit: 0.5")
plot(gBuffer(l2,joinStyle="MITRE",mitreLimit=1));plot(l2,col='blue',add=TRUE)
 title("mitreLimit: 1")
plot(gBuffer(l2,joinStyle="MITRE",mitreLimit=3));plot(l2,col='blue',add=TRUE)
 title("mitreLimit: 3")



