library(spData)


### Name: columbus
### Title: Columbus OH spatial analysis data set
### Aliases: columbus col.gal.nb coords polys bbs
### Keywords: datasets sp spdep

### ** Examples

if (requireNamespace("rgdal", quietly = TRUE)) {
  library(rgdal)
  columbus <- readOGR(system.file("shapes/columbus.shp", package="spData")[1])
  plot(columbus)
}

if (requireNamespace("spdep", quietly = TRUE)) {
  library(spdep)
  col.gal.nb <- read.gal(system.file("weights/columbus.gal", package="spData")[1])
}



