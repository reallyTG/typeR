library(imager)


### Name: rm.alpha
### Title: Remove alpha channel and store as attribute
### Aliases: rm.alpha

### ** Examples

#An image with 4 colour channels (RGBA)
im <- imfill(2,2,val=c(0,0,0,0))
#Remove fourth channel
rm.alpha(im) 
attr(rm.alpha(im),"alpha")



