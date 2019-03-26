library(adespatial)


### Name: rotation
### Title: Rotate a set of point by a certain angle
### Aliases: rotation
### Keywords: manip

### ** Examples


### Create a set of coordinates
coords<-cbind(runif(20),runif(20))

### Create a series of angles
rad<-seq(0,pi,l=20)

for(i in rad){
	coords.rot<-rotation(coords,i)
	plot(coords.rot)
}

### Rotate the coordinates by an angle of 90 degrees
coords.90<-rotation(coords,90*pi/180)
coords.90

plot(coords,xlim=range(rbind(coords.90,coords)[,1]),ylim=range(rbind(coords.90,coords)[,2]),asp=1)
points(coords.90,pch=19)




