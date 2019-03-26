library(Rvcg)


### Name: vcgIsosurface
### Title: Create Isosurface from 3D-array
### Aliases: vcgIsosurface

### ** Examples

#this is the example from the package "misc3d"
x <- seq(-2,2,len=50)
g <- expand.grid(x = x, y = x, z = x)
v <- array(g$x^4 + g$y^4 + g$z^4, rep(length(x),3))
storage.mode(v) <- "integer"
## Not run: 
##D mesh <- vcgIsosurface(v,threshold=10)
##D require(rgl)
##D wire3d(mesh)
##D ##now smooth it a little bit
##D wire3d(vcgSmooth(mesh,"HC",iteration=3),col=3)
## End(Not run)



