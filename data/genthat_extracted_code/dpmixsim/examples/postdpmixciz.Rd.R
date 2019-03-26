library(dpmixsim)


### Name: postdpmixciz
### Title: Summary statistics and cluster estimation
### Aliases: postdpmixciz
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Example: MRI brain image segmentation
##D   slicedata <- readsliceimg(fbase="t1_pn3_rf0", swap=FALSE)
##D   image(slicedata$niislice, col=gray((0:255)/256), main="original image")
##D   x0 <- premask(slicedata, subsamp=TRUE)
##D   x  <- prescale(x0) 
##D   rec <- 3000
##D   res <- dpmixsim(x, M=1, a=1, b=2, upalpha=1, maxiter=4000,
##D       rec=rec, nclinit=8)
##D   ## post-simulation
##D   ngrid <- 200
##D   z <- postdpmixciz(x, res=res, rec=rec, ngrid=ngrid, plot=TRUE)
## End(Not run)


