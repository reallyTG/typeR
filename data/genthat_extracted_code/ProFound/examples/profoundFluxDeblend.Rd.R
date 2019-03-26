library(ProFound)


### Name: profoundFluxDeblend
### Title: Mid Level Image Deblender
### Aliases: profoundFluxDeblend
### Keywords: deblend

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D 
##D profound=profoundProFound(image, magzero=30, verbose=TRUE, plot=TRUE)
##D 
##D deblend=profoundFluxDeblend(profound)
##D 
##D plot(profound$segstats$mag, deblend$mag_db)
## End(Not run)



