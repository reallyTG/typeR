library(SpatialPosition)


### Name: quickStewart
### Title: Create a SpatialPolygonsDataFrame of Potentials Contours
### Aliases: quickStewart

### ** Examples

# load data
data("spatData")
# Compute a SpatialPolygonsDataFrame of potentials
pot.spdf <- quickStewart(spdf = spatPts, 
                         df = spatPts@data, 
                         var = "Capacite", 
                         span = 1000, 
                         beta = 2, mask = spatMask)
plot(pot.spdf)
# cartography
if(require("cartography")){
  breaks <- sort(c(unique(pot.spdf$min), max(pot.spdf$max)), decreasing = FALSE)
  cartography::choroLayer(spdf = pot.spdf, df = pot.spdf@data,
                          var = "center", breaks = breaks, 
                          legend.pos = "topleft",
                          legend.title.txt = "Nb. of Beds")
}
pot.spdf@data


# Compute a SpatialPolygonsDataFrame of a ratio of potentials
spatPts$dummy <- spatPts$Capacite + c(rep(50, 18))
pot2.spdf <- quickStewart(spdf = spatPts, 
                          df = spatPts@data, 
                          var = "Capacite", 
                          var2 = "dummy",
                          span = 1000, 
                          beta = 2, mask = spatMask)
# cartography
if(require("cartography")){
  breaks <- sort(c(unique(pot2.spdf$min), max(pot2.spdf$max)), decreasing = FALSE)
  cartography::choroLayer(spdf = pot2.spdf, df = pot2.spdf@data,
                          var = "center", breaks = breaks, 
                          legend.pos = "topleft",legend.values.rnd = 3,
                          legend.title.txt = "Nb. of Beds")
}



