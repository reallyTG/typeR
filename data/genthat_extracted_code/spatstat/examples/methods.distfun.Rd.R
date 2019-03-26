library(spatstat)


### Name: methods.distfun
### Title: Geometrical Operations for Distance Functions
### Aliases: methods.distfun shift.distfun rotate.distfun
###   scalardilate.distfun affine.distfun flipxy.distfun reflect.distfun
###   rescale.distfun
### Keywords: spatial methods

### ** Examples

   (f <- distfun(letterR))
   plot(f)
   flipxy(f)
   shift(f, origin="midpoint")
   plot(rotate(f, angle=pi/2))

   (g <- distfun(lansing))
   rescale(g)



