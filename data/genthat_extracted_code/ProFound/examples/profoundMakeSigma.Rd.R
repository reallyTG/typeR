library(ProFound)


### Name: profoundMakeSigma
### Title: Make a Sigma Map
### Aliases: profoundMakeSigma
### Keywords: sigma

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))
##D profound=profoundProFound(image)
##D 
##D sigma_est=profoundMakeSigma(image$imDat, objects=profound$objects, sky=profound$sky,
##D skyRMS=profound$skyRMS)
## End(Not run)



