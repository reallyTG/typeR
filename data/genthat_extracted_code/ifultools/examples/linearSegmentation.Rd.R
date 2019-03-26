library(ifultools)


### Name: linearSegmentation
### Title: Piecewise linear segmentation of a time series
### Aliases: linearSegmentation
### Keywords: data manip ts

### ** Examples

## obtain some data with approximately 
## piecewise-linear trends 
x <- seq(0,2*pi,length=100)
y <- sin(x)

## perform linear segmentation with aspect ratio 
## dilation using a 5 degree tolerance and 5 
## point windows 
z <- linearSegmentation(x, y, n.fit=5, angle.tolerance=5, aspect=TRUE)

## plot the data and the estimated change-points 
plot(x, y)
abline(v=x[z], lty=2)



