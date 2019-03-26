library(wvtool)


### Name: gabor.filter
### Title: Two Dimensional Gabor Filtering in Frequency Domain
### Aliases: gabor.filter

### ** Examples

data(cryptomeria)
img <- rgb2gray(cryptomeria)
img <- crop(img,300,300)
# simple example
test <- gabor.filter(x=img, lamda=8, theta=60, bw=1.5, phi=0, asp=0.3, disp=TRUE)
## Not run: 
##D # azimuthal intensity distribution with respect to the orientation of Gabor function
##D par(mfrow=c(2,1))
##D Integ <- array()
##D filt.img <- matrix(0, nrow(img), ncol(img))
##D for ( i in 1:60) {
##D out <- gabor.filter(x=img, lamda=8, theta=3*i, bw=1.5, phi=0, asp=0.3)
##D filt.img <- out$filtered_img + filt.img
##D Integ[i] <- sum(out$filtered_img*out$filtered_img)
##D }
##D image(rot90c(filt.img),col=gray(c(0:255)/255),asp=1,axes=FALSE, useRaster=TRUE)
##D x <- 1:60
##D plot(3*x,Integ, ty="l", ylab="integrated intensity (a.u.)", xlab="azimuthal angle (deg)")
## End(Not run)



