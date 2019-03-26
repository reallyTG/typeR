library(ProFound)


### Name: profoundMakeSkyMap
### Title: Calculate Sky Maps
### Aliases: profoundMakeSkyMap profoundMakeSkyGrid
### Keywords: sky RMS

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))$imDat
##D magimage(image)
##D skymap = profoundMakeSkyMap(image, box=c(89,89))
##D magimage(skymap$sky)
##D magimage(skymap$skyRMS)
##D 
##D # Now again, masking out the known objects (will not help too much in this case):
##D 
##D segim=profoundMakeSegim(image, skycut=1.5, plot=TRUE)
##D segim_ex=profoundMakeSegimExpand(image, segim$segim, skycut=-Inf, plot=TRUE)
##D 
##D skymap=profoundMakeSkyMap(image, objects=segim_ex$objects, box=c(89,89))
##D magimage(skymap$sky, magmap=FALSE)
##D magimage(skymap$skyRMS, magmap=FALSE)
##D 
##D # We can bilinear interpolate this onto the full image grid:
##D 
##D skybil = profoundMakeSkyGrid(image, objects=segim_ex$objects, box=c(89,89),
##D type='bilinear')
##D magimage(skybil$sky, magmap=FALSE)
##D magimage(skybil$skyRMS, magmap=FALSE)
##D 
##D # Or we can bicubic interpolate this onto the full image grid:
##D 
##D skybic = profoundMakeSkyGrid(image, objects=segim_ex$objects, box=c(89,89), type='bicubic')
##D magimage(skybic$sky, magmap=FALSE)
##D magimage(skybic$skyRMS, magmap=FALSE)
##D 
##D # The differences tend to be at the edges:
##D 
##D magimage(skybil$sky-skybic$sky, magmap=FALSE)
##D magimage(skybil$skyRMS-skybic$skyRMS, magmap=FALSE)
## End(Not run)



