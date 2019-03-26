library(spatstat)


### Name: diameter.boxx
### Title: Geometrical Calculations for Multi-Dimensional Box
### Aliases: diameter.boxx volume.boxx shortside.boxx sidelengths.boxx
###   eroded.volumes.boxx
### Keywords: spatial math

### ** Examples

    X <- boxx(c(0,10),c(0,10),c(0,5),c(0,2))
    diameter(X) 
    volume(X)
    shortside(X)
    sidelengths(X)
    hd <- shortside(X)/2
    eroded.volumes(X, seq(0,hd, length=10))



