library(spatstat)


### Name: diameter.box3
### Title: Geometrical Calculations for Three-Dimensional Box
### Aliases: diameter.box3 volume.box3 shortside.box3 sidelengths.box3
###   eroded.volumes.box3 shortside sidelengths eroded.volumes
### Keywords: spatial math

### ** Examples

    X <- box3(c(0,10),c(0,10),c(0,5))
    diameter(X) 
    volume(X)
    sidelengths(X)
    shortside(X)
    hd <- shortside(X)/2
    eroded.volumes(X, seq(0,hd, length=10))



