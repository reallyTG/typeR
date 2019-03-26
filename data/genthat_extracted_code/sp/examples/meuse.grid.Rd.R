library(sp)


### Name: meuse.grid
### Title: Prediction Grid for Meuse Data Set
### Aliases: meuse.grid
### Keywords: datasets

### ** Examples

data(meuse.grid)
coordinates(meuse.grid) = ~x+y
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
gridded(meuse.grid) = TRUE
spplot(meuse.grid)



