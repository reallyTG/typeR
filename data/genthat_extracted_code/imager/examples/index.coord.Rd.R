library(imager)


### Name: index.coord
### Title: Linear index in internal vector from pixel coordinates
### Aliases: index.coord

### ** Examples

im <- as.cimg(function(x,y) x+y,100,100)
px <- index.coord(im,data.frame(x=c(3,3),y=c(1,2)))
im[px] #Values should be 3+1=4, 3+2=5



