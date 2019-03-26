library(R4dfp)


### Name: R4dfp.Recycle
### Title: Reload a 4dfp MRI Image.
### Aliases: R4dfp.Recycle
### Keywords: utilities data

### ** Examples

#create an image and reload it with direct writing
myimage <- R4dfp.Blank333("newimage.4dfp.ifh")
myimage <- R4dfp.Recycle(myimage,direct.write=TRUE)



