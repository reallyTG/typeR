library(tweet2r)


### Name: tspan
### Title: Exploratory point pattern analysis.
### Aliases: tspan
### Keywords: point pattern

### ** Examples

library(sp)
library(spatstat)

#loada a SpatialPointsDataFrame
data("meuse.grid_ll")


# run function without contour
tspan(meuse.grid_ll,bw=0.0005)

#providing a contour as SpatialPointDataFrame
data("meuse.area")

#build the acontour layer 
cont<-SpatialPoints(meuse.area, proj4string = CRS("+init=epsg:28992"))
#transform to meuse.grid_ll reference system
cont<-spTransform(cont, CRS("+init=epsg:4326"))

# run function with contour
tspan(meuse.grid_ll,bw=0.0005, cont = TRUE, acontour=cont)
{
  }



