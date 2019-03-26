library(R4dfp)


### Name: R4dfp.Blank
### Title: Create a Blank 4dfp MRI Image.
### Aliases: R4dfp.Blank R4dfp.Blank333 R4dfp.Blank111
### Keywords: utilities data

### ** Examples

#create a new image and load it for direct writing
myimage <- R4dfp.Blank333("myimage.4dfp.ifh")
myimage <- R4dfp.Recycle(myimage,direct.write=TRUE)



