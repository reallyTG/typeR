library(spatstat)


### Name: im
### Title: Create a Pixel Image Object
### Aliases: im
### Keywords: spatial manip datagen

### ** Examples

   vec <- rnorm(1200)
   mat <- matrix(vec, nrow=30, ncol=40)
   whitenoise <- im(mat)
   whitenoise <- im(mat, xrange=c(0,1), yrange=c(0,1))
   whitenoise <- im(mat, xcol=seq(0,1,length=40), yrow=seq(0,1,length=30))
   whitenoise <- im(vec, xcol=seq(0,1,length=40), yrow=seq(0,1,length=30))
   plot(whitenoise)

   # Factor-valued images:
   f <- factor(letters[1:12])
   dim(f) <- c(3,4)
   Z <- im(f)

   # Factor image from other image:
   cutwhite <- cut(whitenoise, 3)
   plot(cutwhite)

   # Factor image from raw data
   cutmat <- cut(mat, 3)
   dim(cutmat) <- c(30,40)
   cutwhite <- im(cutmat)
   plot(cutwhite)



