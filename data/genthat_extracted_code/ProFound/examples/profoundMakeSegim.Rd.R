library(ProFound)


### Name: profoundMakeSegim
### Title: Watershed Image Segmentation
### Aliases: profoundMakeSegim
### Keywords: segmentation watershed

### ** Examples

## Not run: 
##D image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
##D package="ProFound"))$imDat
##D segim=profoundMakeSegim(image, plot=TRUE)
##D 
##D #Providing a mask entirely removes regions of the image for segmentation:
##D mask=matrix(0,dim(image)[1],dim(image)[2])
##D mask[1:80,]=1
##D profoundMakeSegim(image, mask=mask, plot=TRUE)
##D 
##D #Providing a previously created object map can sometimes help with detection (not here):
##D profoundMakeSegim(image, mask=mask, object=segim$objects, plot=TRUE)
## End(Not run)



