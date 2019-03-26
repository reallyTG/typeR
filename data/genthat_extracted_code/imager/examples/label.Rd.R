library(imager)


### Name: label
### Title: Label connected components.
### Aliases: label

### ** Examples

imname <- system.file('extdata/parrots.png',package='imager')
im <- load.image(imname) %>% grayscale
#Thresholding yields different discrete regions of high intensity
regions <- isoblur(im,10) %>% threshold("97%") 
labels <- label(regions)
layout(t(1:2))
plot(regions,"Regions")
plot(labels,"Labels")




