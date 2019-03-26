library(beadarrayMSV)


### Name: cart2pol
### Title: Transformation from Cartesian to polar coordinates
### Aliases: cart2pol

### ** Examples

## Points defining a 4-norm unit-circle in the first quadrant
x <- seq(0,1,.01)^(1/4)
y <- (1-x^4)^(1/4)

## Polar coordinates using different distance-measures
eucl <- cart2pol(x,y)
mink <- cart2pol(x,y,'minkowski',4)

## Not run: 
##D ## Plot in cartesian coordinates
##D dev.new()
##D plot(x,y,type='b',main='4-norm unit circle')
##D 
##D ## Plot polar coordinates on cartesian axes
##D dev.new()
##D plot(eucl$th,eucl$r,type='b',col='red',xlab='theta',ylab='r')
##D points(mink$th,mink$r,type='b',col='blue')
##D title(main='Euclidean (red) and 4-norm (blue) distance')
## End(Not run)



