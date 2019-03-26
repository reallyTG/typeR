library(spatstat)


### Name: interp.im
### Title: Interpolate a Pixel Image
### Aliases: interp.im
### Keywords: spatial manip

### ** Examples

   opa <- par(mfrow=c(1,2))
   # coarse image
   V <- as.im(function(x,y) { x^2 + y }, owin(), dimyx=10)
   plot(V, main="coarse image", col=terrain.colors(256))

   # lookup value at location (0.5,0.5)
   V[list(x=0.5,y=0.5)]
   # interpolated value at location (0.5,0.5)
   interp.im(V, 0.5, 0.5)
   # true value is 0.75

   # how to obtain an interpolated image at a desired resolution
   U <- as.im(interp.im, W=owin(), Z=V, dimyx=256)
   plot(U, main="interpolated image", col=terrain.colors(256))
   par(opa)



