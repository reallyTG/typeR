library(ProFound)


### Name: profoundGainEst
### Title: Image Gain Estimator
### Aliases: profoundGainEst
### Keywords: gain

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))
##D profound=profoundProFound(image)
##D profoundGainEst(image$imDat, objects=profound$objects_redo, sky=profound$sky)
## End(Not run)



