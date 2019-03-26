library(pixmap)


### Name: pixmap
### Title: Pixmap Images
### Aliases: pixmap pixmapRGB pixmapGrey pixmapIndexed plot,pixmap-method
###   show,pixmap-method [,pixmap-method
### Keywords: color

### ** Examples

 ## A simple example
 x <- pixmapIndexed(rep(1:8, 9), nrow=6, col=terrain.colors(8))
 plot(x)

 ## The same with different colors, and passing the function instead of
 ## a color vector 
 x <- pixmapIndexed(rep(1:8, 9), nrow=6, col=rainbow)
 plot(x)
 plot(x, asp=.5, axes=TRUE)

 ## Read data from a file
 x <- read.pnm(system.file("pictures/logo.ppm", package="pixmap")[1])
 plot(x)

 ## Another example that math can be beautiful
 x <- seq(-3,3,length=100)
 z1 <- outer(x,x,function(x,y) abs(sin(x)*sin(y)))
 z2 <- outer(x,x,function(x,y) abs(sin(2*x)*sin(y)))
 z3 <- outer(x,x,function(x,y) abs(sin(x)*sin(2*y)))

 ## Notice that we specify a bounding box to get the correct
 ## coordinates on the axes. z1, z2 and z3 are used as red,
 ## green and blue channel, respectively.
 z <- pixmapRGB(c(z1,z2,z3), 100, 100, bbox=c(-1,-1,1,1))
 plot(z, axes=TRUE)

 ## look at a grey version
 plot(as(z, "pixmapGrey"))

 ## subsetting works as expected
 plot(z[1:20,])
 plot(z[,1:40])
 plot(z[1:20,10:40])

 ## overlay different images using transparency
 ## base image as before
 x <- pixmapIndexed(rep(1:8, 9), nrow=6, col=terrain.colors(8))
 plot(x)
 ## make a mask of vertical bars
 mask <- array(0,dim=c(6,12))
 mask[,seq(1,12,3)] <- 1
 ## plot this mask over existing image with transparent and black color
 plot(pixmapIndexed(mask,col=c("NA","#000000")),add=TRUE)



