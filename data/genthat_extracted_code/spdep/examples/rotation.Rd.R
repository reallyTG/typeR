library(spdep)


### Name: Rotation
### Title: Rotate a set of point by a certain angle
### Aliases: Rotation
### Keywords: manip

### ** Examples

set.seed(1)
### Create a set of coordinates
coords<-cbind(runif(20),runif(20))

### Create a series of angles
rad<-seq(0,pi,l=20)

opar <- par(mfrow=c(5,4))
for(i in rad){
	coords.rot<-Rotation(coords,i)
	plot(coords.rot)
}
par(opar)

### Rotate the coordinates by an angle of 90 degrees
coords.90<-Rotation(coords,90*pi/180)
coords.90

plot(coords,xlim=range(rbind(coords.90,coords)[,1]),ylim=range(rbind(coords.90,coords)[,2]),asp=1)
points(coords.90,pch=19)



