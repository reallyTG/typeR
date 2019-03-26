library(dpmixsim)


### Name: dpmixsim
### Title: Dirichlet Process mixture model for clustering and image
###   segmentation
### Aliases: dpmixsim
### Keywords: models

### ** Examples

## Not run: 
##D ## Example 1: simple test using `galaxy' data
##D   data("galaxy")
##D   x0 <- galaxy$speed
##D   x  <- prescale(x0) 
##D   maxiter <- 4000; rec <- 3000; ngrid <- 100
##D   res <- dpmixsim(x, M=1, a=1, b=0.1, upalpha=1, maxiter=maxiter, rec=rec,
##D     nclinit=4)
##D   z <-  postdpmixciz(x=x, res=res, rec=rec, ngrid=ngrid, plot=T)
##D   ##
##D   res <- dpmixsim(x, M=2, a=1, b=0.001, upalpha=0, maxiter=maxiter,
##D     rec=rec, nclinit=4)
##D   z <-  postdpmixciz(x, res=res, rec=rec, ngrid=ngrid, plot=T)
##D ##-----------------
##D ## Example 2: 
##D   demo(testMarronWand)
##D ##-----------------
##D ## Example 3: MRI segmentation
##D ## Testing note: this example should reproduce the equivalent segmented
##D ## images used in the author's references 
##D   slicedata <- readsliceimg(fbase="t1_pn3_rf0", swap=FALSE)
##D   image(slicedata$niislice, col=gray((0:255)/256), main="original image")
##D   x0 <- premask(slicedata, subsamp=TRUE)
##D   x  <- prescale(x0) 
##D   rec <- 3000
##D   res <- dpmixsim(x, M=1, a=1, b=1, upalpha=1, maxiter=4000,
##D       rec=rec, nclinit=8, minvar=0.002)
##D   ## post-simulation
##D   ngrid <- 200
##D   z <- postdpmixciz(x, res=res, rec=rec, ngrid=ngrid, plot=TRUE)
##D   x0 <- premask(slicedata, subsamp=FALSE) # use full-sized image after estimation 
##D   x  <- prescale(x0) 
##D   cx   <- postdataseg(x, z, ngrid=ngrid)
##D   cat("*** view grouped segmentations:\n")
##D   postimgclgrp(slicedata$mask, cx, palcolor=FALSE)
##D   cat("*** display all clusters:\n")
##D   postimgcomps(slicedata$mask, cx)
##D   cat("*** re-cluster with 4 clusters:\n")
##D   postkcluster(slicedata$mask, cx, clk=4)
## End(Not run)



