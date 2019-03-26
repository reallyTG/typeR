library(gstat)


### Name: plot.variogramCloud
### Title: Plot and Identify Data Pairs on Sample Variogram Cloud
### Aliases: plot.variogramCloud
### Keywords: dplot

### ** Examples

library(sp)
data(meuse)
coordinates(meuse) = ~x+y
plot(variogram(log(zinc)~1, meuse, cloud=TRUE))
## commands that require interaction:
# x <- variogram(log(zinc)~1, loc=~x+y, data=meuse, cloud=TRUE)
# plot(plot(x, identify = TRUE), meuse)
# plot(plot(x, digitize = TRUE), meuse)



