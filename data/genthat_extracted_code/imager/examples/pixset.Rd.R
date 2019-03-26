library(imager)


### Name: pixset
### Title: Pixel sets (pixsets)
### Aliases: pixset

### ** Examples

#A test on an image returns a pixset
boats > 250
#Pixsets can be combined using the usual Boolean operators
(boats > 230) & (Xc(boats) < width(boats)/2)
#Subset an image using a pixset
boats[boats > 250]
#Turn a pixset into an image
as.cimg(boats > 250)
#Equivalently:
(boats > 250) + 0



