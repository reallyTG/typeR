library(ifultools)


### Name: scaleZoom
### Title: Zoom in on a specified region of a data matrix
### Aliases: scaleZoom
### Keywords: hplot

### ** Examples

## create an image 
x <- y <- seq(-4*pi, 4*pi, len=50)
r <- sqrt(outer(x^2, y^2, "+"))
z <- cos(r^2)*exp(-r/6)
image(x,y,z,col=gray((0:32)/32))

## zoom in on one portion of that image and 
## re-display 
zoom <- scaleZoom(x,y,z, zoom=c(-5,5,-1,10), logxy="")
image(zoom$x, zoom$y, zoom$z, col=gray((0:32)/32))



