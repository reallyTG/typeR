library(quickPlot)


### Name: equalExtent
### Title: Assess whether a list of extents are all equal
### Aliases: equalExtent equalExtent,list-method

### ** Examples

library(igraph)
library(raster)

files <- system.file("maps", package = "quickPlot") %>%
  dir(., full.names = TRUE, pattern = "tif")
maps <- lapply(files, function(x) raster(x))
names(maps) <- sapply(basename(files), function(x) {
  strsplit(x, split = "\\.")[[1]][1]
})
extnts <- lapply(maps, extent)
equalExtent(extnts) ## TRUE




