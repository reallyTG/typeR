library(ProFound)


### Name: profoundMakeSegimExpand
### Title: Segmentation Map Expansion and Dilation
### Aliases: profoundMakeSegimExpand profoundMakeSegimDilate
### Keywords: segmentation

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))$imDat
##D segim=profoundMakeSegim(image, plot=TRUE, skycut=2)
##D profoundMakeSegimExpand(image, segim$segim, plot=TRUE, skycut=1)
##D profoundMakeSegimDilate(image, segim$segim, plot=TRUE)
##D 
##D #Some other examples:
##D 
##D profoundMakeSegimExpand(image, segim$segim, plot=TRUE, skycut=0)
##D profoundMakeSegimExpand(image, segim$segim, plot=TRUE, skycut=-Inf, sigma=3)
##D 
##D profoundMakeSegimDilate(image, segim$segim, plot=TRUE, size = 15)
##D profoundMakeSegimDilate(image, segim$segim, plot=TRUE, size = 21)
##D 
##D #This expansion process is a *much* better idea then simply setting the original skycut
##D #to a low value like 1/0:
##D profoundMakeSegim(image, plot=TRUE, skycut = 1)
##D profoundMakeSegim(image, plot=TRUE, skycut = 0)
## End(Not run)



