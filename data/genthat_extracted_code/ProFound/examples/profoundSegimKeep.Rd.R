library(ProFound)


### Name: profoundSegimKeep
### Title: Merge Segmentation Map with Grouped Segmentation map
### Aliases: profoundSegimKeep
### Keywords: segim merge

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D 
##D profound=profoundProFound(image, magzero=30, groupstats=TRUE, verbose=TRUE, plot=TRUE)
##D 
##D segim_new=profoundSegimKeep(profound$segim, profound$group$groupim, groupID_merge=1,
##D segID_merge=list(c(12, 26, 62), c(13, 24)))
##D 
##D profoundSegimPlot(image, segim=segim_new)
## End(Not run)



