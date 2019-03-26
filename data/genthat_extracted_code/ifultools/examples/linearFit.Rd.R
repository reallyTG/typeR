library(ifultools)


### Name: linearFit
### Title: Linear regression of a segmented time series
### Aliases: linearFit
### Keywords: utilities

### ** Examples

## obtain some data with approximately 
## piecewise-linear trends 
x <- seq(0,2*pi,length=100)
y <- sin(x)

## perform linear segmentation with aspect ratio 
## dilation using a 5 degree tolerance and 5 
## point windows. regress the widest of these 
## segments with the lm() function. 
linearFit(x, y, n.fit=5, angle.tolerance=5, aspect=TRUE,
    method="widest", fit=lm)



