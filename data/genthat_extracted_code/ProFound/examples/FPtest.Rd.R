library(ProFound)


### Name: FPtest
### Title: False Positive Reference Data
### Aliases: FPtest
### Keywords: datasets

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D profound=profoundProFound(image, magzero=30, rotstats=TRUE)
##D skyRMS=median(profound$skyRMS)
##D magoff=profoundFlux2Mag(skyRMS, 30)
##D totpix=prod(profound$dim)
##D 
##D #We can easily compute the expected number of false positives on an image this size:
##D data("FPtest")
##D dim(FPtest)[1]*totpix/1e6/1e3
##D 
##D #And plot the detections and expected false positive distributions:
##D maghist(profound$segstats$mag, seq(-11,-1,by=0.2)+magoff)
##D maghist(FPtest$mag+magoff, seq(-6,-1,by=0.2)+magoff, scale=totpix/1e6/1e3, add=TRUE,
##D border='red')
## End(Not run)



