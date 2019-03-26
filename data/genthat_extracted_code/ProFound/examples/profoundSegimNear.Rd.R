library(ProFound)


### Name: profoundSegimNear
### Title: Segment Neighbour IDs
### Aliases: profoundSegimNear
### Keywords: segments

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
##D profound=profoundProFound(image, skycut=1.5, magzero=30, verbose=TRUE)
##D 
##D #Look for nearby (in this case touching) neighbours
##D 
##D near=profoundSegimNear(profound$segim)
##D 
##D #Look at the first few rows (segIDs 1:5):
##D 
##D near[1:5,]
##D 
##D #To access the embedded vectors you have to use unlist:
##D 
##D unlist(near[3,2])
##D 
##D #We can check to see which segments are touching segID number 3:
##D 
##D profoundSegimPlot(image$imDat, profound$segim)
##D magimage(profound$segim==3, col=c(NA,'red'), add=TRUE)
##D magimage(matrix(profound$segim %in% unlist(near[3,2]), dim(profound$segim)[1]),
##D col=c(NA,'blue'), add=TRUE)
## End(Not run)



