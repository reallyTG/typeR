library(stinepack)


### Name: stinemanSlopes
### Title: Estimate the slope of an interpolating function using an arc
### Aliases: stinemanSlopes
### Keywords: math ts smooth

### ** Examples

## Interpolate a smooth curve
x <- seq(0,2*pi,by=pi/6)
y <- sin(x)
stinemanSlopes(x,y,scale=TRUE)
stinemanSlopes(x,y,scale=FALSE)



