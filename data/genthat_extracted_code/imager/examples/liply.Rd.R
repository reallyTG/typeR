library(imager)


### Name: liply
### Title: Apply function to each element of a list, then combine the
###   result as an image by appending along specified axis
### Aliases: liply

### ** Examples

build.im <- function(size) as.cimg(function(x,y) (x+y)/size,size,size)
liply(c(10,50,100),build.im,"y") %>% plot



