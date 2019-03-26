library(spatstat)


### Name: as.tess
### Title: Convert Data To Tessellation
### Aliases: as.tess as.tess.tess as.tess.im as.tess.owin
###   as.tess.quadratcount as.tess.quadrattest as.tess.list
### Keywords: spatial manip

### ** Examples

 # pixel image
 v <- as.im(function(x,y){factor(round(5 * (x^2 + y^2)))}, W=owin())
 levels(v) <- letters[seq(length(levels(v)))]
 as.tess(v)
 # quadrat counts
 data(nztrees)
 qNZ <- quadratcount(nztrees, nx=4, ny=3)
 as.tess(qNZ)



