library(ProFound)


### Name: profoundMakeSegimPropagate
### Title: Propagate Identified Segments
### Aliases: profoundMakeSegimPropagate
### Keywords: propagate

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D 
##D profound=profoundProFound(image, skycut=1.5, magzero=30, verbose=TRUE, plot=TRUE)
##D 
##D tempprop=profoundMakeSegimPropagate(image$imDat, segim=profound$segim, plot=TRUE)
##D 
##D tempprop_stats=profoundSegimStats(image$imDat, segim=tempprop$propim_sky,
##D sky=profound$sky, skyRMS=profound$skyRMS)
##D 
##D magplot(profound$segstats$mag, tempprop_stats$flux/tempprop_stats$N100, grid=TRUE)
##D 
##D #You can stop the propogation using a mask:
##D 
##D mask=array(0, dim=dim(image$imDat))
##D mask[1:50,]=1
##D 
##D profoundMakeSegimPropagate(image$imDat, segim=profound$segim, plot=TRUE, mask=mask)
## End(Not run)



