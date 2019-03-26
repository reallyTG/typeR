library(intamap)


### Name: plotIntamap
### Title: plot intamap objects
### Aliases: plotIntamap plot.default plot.copula plot.idw plot.automap
###   plot.linearVariogram plot.transGaussian plot.yamamoto
### Keywords: spatial

### ** Examples

data(meuse)
meuse$value = log(meuse$zinc)
data(meuse.grid)
coordinates(meuse) = ~x+y
coordinates(meuse.grid) = ~x+y
object = interpolate(meuse, meuse.grid, 
                     outputWhat = list(mean = TRUE, variance = TRUE, 
                     excprob = 7, excprob = 8, quantile = 0.9, quantile = 0.95),
                     methodName = "automap")
plot(object)



