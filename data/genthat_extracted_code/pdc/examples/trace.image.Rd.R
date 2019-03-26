library(pdc)


### Name: traceImage
### Title: Shape Tracing of an Image
### Aliases: traceImage trace.image convertImage convert.image

### ** Examples

# create a filled rectangle in a 20x20 image
img <- matrix(0, nrow=20,ncol=20)
img[5:15,5:15] <- 1

# create shape signature
signature <- traceImage(img)

# plot both original image and shape signature
par(mfrow=c(1,3))
#layout(matrix(c(1,2,2), 1, 3, byrow = TRUE))
image(img)
plot(signature$angle, signature$distance,type="l",xlab="angle",ylab="distance")

# reconstruct radial plot
## No test: 
 
require("plotrix")
radial.plot(traceImage(img,resolution=500)$distance,start=0,rp.type="r",radial.lim=c(0,10))
## End(No test)



