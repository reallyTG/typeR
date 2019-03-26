library(gstat)


### Name: hscat
### Title: Produce h-scatterplot
### Aliases: hscat
### Keywords: models

### ** Examples

library(sp)
data(meuse)
coordinates(meuse) = ~x+y
hscat(log(zinc)~1, meuse, c(0, 80, 120, 250, 500, 1000))



