library(ProFound)


### Name: profoundSegimGroup
### Title: Create Segmentation Groups
### Aliases: profoundSegimGroup
### Keywords: segments

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D profound=profoundProFound(image, skycut=1.5, magzero=30, verbose=TRUE)
##D 
##D #Look for nearby (in this case touching) neighbours
##D 
##D group=profoundSegimGroup(profound$segim)
##D 
##D #Look at the first few rows (groups 1:5):
##D 
##D group$groupsegID[1:5,]
##D 
##D #To access the embedded vectors you have to use unlist:
##D 
##D unlist(group$groupsegID[1,2])
##D 
##D #We can check to see which segments are in group number 1:
##D 
##D profoundSegimPlot(image$imDat, profound$segim)
##D magimage(group$groupim==1, col=c(NA,'red'), add=TRUE)
## End(Not run)



