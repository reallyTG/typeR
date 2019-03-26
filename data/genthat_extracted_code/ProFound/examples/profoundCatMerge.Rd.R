library(ProFound)


### Name: profoundCatMerge
### Title: Catalogue Merging Tool
### Aliases: profoundCatMerge
### Keywords: segim

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D profound=profoundProFound(image, skycut=1.5, magzero=30, groupstats=TRUE, verbose=TRUE)
##D 
##D merge=profoundCatMerge(profound$segstats, profound$groupstats,
##D profound$group$groupsegID, 1)
##D 
##D profound$segstats[1,'mag']
##D merge[1,'mag'] #The merged object is brighter, as we should expect.
## End(Not run)



