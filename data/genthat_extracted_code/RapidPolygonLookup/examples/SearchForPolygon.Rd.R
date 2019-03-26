library(RapidPolygonLookup)


### Name: SearchForPolygon
### Title: Use kd-trees to search the nearest neighbour polygons for a
###   given set of points
### Aliases: SearchForPolygon

### ** Examples

data(sf.crime.2012, envir = environment())
data(sf.polys, envir = environment())
XY.polys <- SearchForPolygon(poly.list= sf.polys, XY= sf.crime.2012[1:1000,], k= 10,
                             poly.id= "fips", poly.id.colname= "census.block",
                             verbose= TRUE)




