library(imager)


### Name: as.cimg
### Title: Convert to cimg object
### Aliases: as.cimg as.cimg.numeric as.cimg.logical as.cimg.double
###   as.cimg.cimg as.cimg.vector as.cimg.matrix

### ** Examples

as.cimg(1:100,x=10,y=10) #10x10, grayscale image
as.cimg(rep(1:100,3),x=10,y=10,cc=3) #10x10 RGB
as.cimg(1:100,dim=c(10,10,1,1))
as.cimg(1:100) #Guesses dimensions, warning is issued
as.cimg(rep(1:100,3)) #Guesses dimensions, warning is issued



