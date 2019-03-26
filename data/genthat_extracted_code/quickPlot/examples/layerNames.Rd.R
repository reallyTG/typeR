library(quickPlot)


### Name: layerNames
### Title: Extract the layer names of Spatial Objects
### Aliases: layerNames layerNames,list-method layerNames,ANY-method
###   layerNames,Raster-method layerNames,.quickPlot-method
###   layerNames,igraph-method

### ** Examples

library(igraph)
library(raster)

## RasterLayer objects
files <- system.file("maps", package = "quickPlot") %>%
  dir(., full.names = TRUE, pattern = "tif")
maps <- lapply(files, function(x) raster(x))
names(maps) <- sapply(basename(files), function(x) {
  strsplit(x, split = "\\.")[[1]][1]
})
layerNames(maps)

## Spatial* objects
caribou <- SpatialPoints(coords = cbind(x = stats::runif(1e2, -50, 50),
                                        y = stats::runif(1e2, -50, 50)))
layerNames(caribou)

sr1 <- Polygon(cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2)) * 20 - 50)
sr2 <- Polygon(cbind(c(5, 4, 2, 5), c(2, 3, 2, 2)) * 20 - 50)
srs1 <- Polygons(list(sr1), "s1")
srs2 <- Polygons(list(sr2), "s2")
spP <- SpatialPolygons(list(srs1, srs2), 1:2)
layerNames(spP)

l1 <- cbind(c(10, 2, 30), c(30, 2, 2))
l1a <- cbind(l1[, 1] + .05, l1[, 2] + .05)
l2 <- cbind(c(1, 20, 3), c(10, 1.5, 1))
sl1 <- Line(l1)
sl1a <- Line(l1a)
sl2 <- Line(l2)
s1 <- Lines(list(sl1, sl1a), ID = "a")
s2 <- Lines(list(sl2), ID = "b")
sl <- SpatialLines(list(s1, s2))
layerNames(sl)




