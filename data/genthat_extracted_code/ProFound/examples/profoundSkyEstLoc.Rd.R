library(ProFound)


### Name: profoundSkyEstLoc
### Title: Calculate Sky in Subset of Pixels
### Aliases: profoundSkyEstLoc
### Keywords: sky RMS

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))$imDat
##D profoundSkyEstLoc(image, loc=c(20,20), box=c(40,40), plot=TRUE)$val
##D profoundSkyEstLoc(image, loc=c(40,20), box=c(40,40), plot=TRUE)$val
##D profoundSkyEstLoc(image, loc=c(60,20), box=c(40,40), plot=TRUE)$val
## End(Not run)



