library(sp)


### Name: meuse
### Title: Meuse river data set
### Aliases: meuse
### Keywords: datasets

### ** Examples

data(meuse)
summary(meuse)
coordinates(meuse) <- ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")



