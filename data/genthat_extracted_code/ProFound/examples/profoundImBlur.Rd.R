library(ProFound)


### Name: profoundIm
### Title: Image Transformations
### Aliases: profoundImBlur profoundImGrad profoundImDiff
### Keywords: image

### ** Examples

image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits',
package="ProFound"))$imDat
magimage(image)
profoundImBlur(image, plot=TRUE)
profoundImGrad(image, plot=TRUE)
profoundImDiff(image, plot=TRUE)



