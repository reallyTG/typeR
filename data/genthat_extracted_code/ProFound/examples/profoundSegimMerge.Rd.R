library(ProFound)


### Name: profoundSegimMerge
### Title: Merge Segmentation Maps
### Aliases: profoundSegimMerge
### Keywords: segim

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))$imDat
##D profound=profoundProFound(image, plot=TRUE)
##D profound_diff=profoundProFound(profoundImDiff(image, sigma=2), plot=TRUE)
##D tempmerge=profoundSegimMerge(image, profound$segim, profound_diff$segim)
##D 
##D #Notice the new embedded blue segment near the centre:
##D 
##D profoundSegimPlot(image, segim=tempmerge)
## End(Not run)



