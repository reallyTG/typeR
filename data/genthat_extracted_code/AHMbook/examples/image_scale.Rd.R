library(AHMbook)


### Name: image_scale
### Title: Helper function to draw scale for image
### Aliases: image_scale image.scale

### ** Examples

# uses the built-in volcano data set
require(grDevices) # for colours
require(graphics)
par(mar = c(3,3,3,6))  # make the right margin wide enough
image(t(volcano)[ncol(volcano):1,], col=terrain.colors(12)) 
image_scale(volcano, col=terrain.colors(12))
# Try placing the scale bar on the left
par(mar = c(3,8,3,1))  # make the left margin wide enough
image(t(volcano)[ncol(volcano):1,], col=terrain.colors(12)) 
image_scale(volcano, col=terrain.colors(12), x= -0.28, digits=0)
# Trial and error needed to get the x value right.



