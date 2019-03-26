library(spatstat)


### Name: Extract.im
### Title: Extract Subset of Image
### Aliases: [.im
### Keywords: spatial manip

### ** Examples

 # make up an image
 X <- setcov(unit.square())
 plot(X)

 # a rectangular subset
 W <- owin(c(0,0.5),c(0.2,0.8))
 Y <- X[W]
 plot(Y)

 # a polygonal subset
 R <- affine(letterR, diag(c(1,1)/2), c(-2,-0.7))
 plot(X[R, drop=FALSE])
 plot(X[R, drop=FALSE, tight=TRUE])

 # a point pattern
 P <- rpoispp(20)
 Y <- X[P]

 # look up a specified location
 X[list(x=0.1,y=0.2)]

 # 10 x 10 pixel array
 X <- as.im(function(x,y) { x + y }, owin(c(-1,1),c(-1,1)), dimyx=10)
 # 100 x 100 
 W <- as.mask(disc(1, c(0,0)), dimyx=100)
 # 10 x 10 raster
 X[W,drop=FALSE]
 # 100 x 100 raster
 X[W, raster=W, drop=FALSE]



