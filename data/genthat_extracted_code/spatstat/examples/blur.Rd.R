library(spatstat)


### Name: blur
### Title: Apply Gaussian Blur to a Pixel Image
### Aliases: blur Smooth.im
### Keywords: spatial nonparametric

### ** Examples

   data(letterR)
   Z <- as.im(function(x,y) { 4 * x^2 + 3 * y }, letterR)
   par(mfrow=c(1,3))
   plot(Z)
   plot(letterR, add=TRUE)
   plot(blur(Z, 0.3, bleed=TRUE))
   plot(letterR, add=TRUE)
   plot(blur(Z, 0.3, bleed=FALSE))
   plot(letterR, add=TRUE)
   par(mfrow=c(1,1))



