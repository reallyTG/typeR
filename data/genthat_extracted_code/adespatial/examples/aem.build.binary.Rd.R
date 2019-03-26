library(adespatial)


### Name: aem.build.binary
### Title: Construct a site-by-edge binary matrix
### Aliases: aem.build.binary
### Keywords: spatial

### ** Examples


### Create an object of class nb (spdep)
if(require("spdep", quietly = TRUE)){
nb<-cell2nb(5,5,"queen")

### Create fictitious geographical coordinates 
xy <- cbind(1:25,expand.grid(1:5,1:5))

### Build a binary site-by-link matrix; remove the site which have identical Y coordinate
### (by default argument: rm.same.y = TRUE)
bin.mat <- aem.build.binary(nb,xy)
str(bin.mat)

### Build a binary site-by-link matrix using the argument link: remove the site which
### have identical Y coordinate (by default argument: rm.same.y = TRUE)
edges<-expand.grid(1,2:25)
bin.mat <- aem.build.binary(coords=xy,link=edges)
str(bin.mat)

### Build a binary site-by-link matrix, making the process affect the points at 
### an angle of 45 degrees
bin.mat.45 <- aem.build.binary(nb,xy, rot.angle=45)
str(bin.mat.45)

### Build a binary site-by-link matrix, making the process affect the points at
### an angle of pi/3 radians
bin.mat.pi3 <- aem.build.binary(nb,xy,unit.angle="radians", rot.angle=pi/3)
str(bin.mat.pi3)
}




