library(imager)


### Name: get.locations
### Title: Return coordinates of subset of pixels
### Aliases: get.locations

### ** Examples

im <- as.cimg(function(x,y) x+y,10,10)
get.locations(im,function(v) v < 4)
get.locations(im,function(v) v^2 + 3*v - 2 < 30)




