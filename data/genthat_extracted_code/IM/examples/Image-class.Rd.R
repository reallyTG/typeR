library(IM)


### Name: Image-class
### Title: Basic class to handle image moment analysis
### Aliases: Image-class initialize,Image-method plotMoment,Image-method
###   setCentroid<-,Image-method setImage<-,Image-method
### Keywords: classes

### ** Examples

# create an object of class "Image"
data(lena)
obj = new("Image",img=img)
#display image
## Not run: displayImg(obj@I)
#convert the object to the class "OrthIm"
obj=as(obj,"OrthIm")



