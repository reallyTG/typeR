library(ProFound)


### Name: profoundGetEllipse
### Title: Calculate single annulus properties of an iso-photal ellipse
### Aliases: profoundGetEllipse
### Keywords: ellipse

### ** Examples

## Not run: 
##D # We need the ProFit library to show the profile: library(ProFit)
##D image = readFITS(system.file("extdata", 'KiDS/G266035fitim.fits',
##D package="ProFit"))$imDat
##D tempxy=cbind(which(image>2e-11 & image<3e-11, arr.ind=TRUE)-0.5,
##D              image[image>2e-11 & image<3e-11])
##D magimage(image>2e-11 & image<3e-11)
##D points(tempxy[,1:2], pch='.', col='red')
##D tempellipse=profoundGetEllipse(tempxy)
##D profoundDrawEllipse(tempellipse['xcen'], tempellipse['ycen'], tempellipse['radhi'],
##D                       tempellipse['axrat'], tempellipse['ang'], col='blue')
## End(Not run)



