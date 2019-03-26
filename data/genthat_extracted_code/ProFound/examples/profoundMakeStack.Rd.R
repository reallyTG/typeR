library(ProFound)


### Name: profoundMakeStack
### Title: Stack Images
### Aliases: profoundMakeStack
### Keywords: stack

### ** Examples

image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))

stack=profoundMakeStack(list(image$imDat, image$imDat, image$imDat),
skyRMS_list = list(8,8,3))

#The new signal-to-noise weighted sky should equal sqrt(1/(1/8^2+1/8^2+1/3^2)) = 2.65

stack$skyRMS



