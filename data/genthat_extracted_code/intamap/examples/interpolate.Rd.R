library(intamap)


### Name: interpolate
### Title: spatial interpolation
### Aliases: interpolate interpolateBlock
### Keywords: spatial

### ** Examples

data(meuse)
coordinates(meuse) = ~x+y
meuse$value = meuse$zinc
data(meuse.grid)
gridded(meuse.grid) = ~x+y
x = interpolate(meuse, meuse.grid, list(mean=TRUE, variance=TRUE))
summary(t(x$outputTable))



