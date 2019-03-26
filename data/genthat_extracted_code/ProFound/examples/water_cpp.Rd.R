library(ProFound)


### Name: water_cpp
### Title: Rcpp Watershed Function
### Aliases: water_cpp water_cpp_old
### Keywords: watershed

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))$imDat
##D 
##D segim=water_cpp(im=image, nx=dim(image_smooth)[1], ny=dim(image_smooth)[2], skycut=10)
##D magimage(segim, col=c(0,rainbow(1e3)))
## End(Not run)



