library(quickPlot)


### Name: numLayers
### Title: Find the number of layers in a Spatial Object
### Aliases: numLayers numLayers,list-method numLayers,.quickPlot-method
###   numLayers,Raster-method numLayers,Spatial-method numLayers,ANY-method

### ** Examples

library(igraph)
library(raster)

files <- system.file("maps", package = "quickPlot") %>%
  dir(., full.names = TRUE, pattern = "tif")
maps <- lapply(files, function(x) raster(x))
names(maps) <- sapply(basename(files), function(x) {
  strsplit(x, split = "\\.")[[1]][1]
})
stck <- stack(maps)

numLayers(maps)
numLayers(stck)




