library(rgdal)


### Name: llgridlines
### Title: Plot long-lat grid over projected data
### Aliases: llgridlines
### Keywords: spatial

### ** Examples

data(meuse)
coordinates(meuse) = ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")
plot(meuse) 
llgridlines(meuse, lty=3)
plot(meuse) 
llgridlines(meuse, lty=3, side = "EN", offset = 0.2)



