library(sp)


### Name: coordinates
### Title: set spatial coordinates to create a Spatial object, or retrieve
###   spatial coordinates from a Spatial object
### Aliases: coordinates coordinates<-
### Keywords: manip

### ** Examples

# data.frame
data(meuse.grid)
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
class(meuse.grid)
bbox(meuse.grid)

data(meuse)
meuse.xy = meuse[c("x", "y")]
coordinates(meuse.xy) <- ~x+y
class(meuse.xy)




