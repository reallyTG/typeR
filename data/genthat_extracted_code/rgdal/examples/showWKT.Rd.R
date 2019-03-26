library(rgdal)


### Name: showWKT
### Title: Show Well-Known Text spatial reference system metadata
### Aliases: showWKT showEPSG showP4
### Keywords: spatial

### ** Examples

cities <- readOGR(system.file("vectors", package = "rgdal")[1], "cities")
readLines(system.file("vectors/cities.prj", package = "rgdal")[1])
showWKT(proj4string(cities))
showWKT("+init=epsg:28992")
showP4(showWKT("+init=epsg:28992"))
showEPSG("+proj=utm +zone=30")
showEPSG("+proj=longlat +ellps=WGS84")



