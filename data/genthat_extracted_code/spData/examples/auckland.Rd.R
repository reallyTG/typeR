library(spData)


### Name: auckland
### Title: Marshall's infant mortality in Auckland dataset
### Aliases: auckland auckland.nb auckpolys
### Keywords: datasets sp

### ** Examples

if (requireNamespace("rgdal", quietly = TRUE)) {
  library(rgdal)
  auckland <- readOGR(system.file("shapes/auckland.shp", package="spData")[1])
  plot(auckland)
  if (requireNamespace("spdep", quietly = TRUE)) {
    library(spdep)
    auckland.nb <- poly2nb(auckland)
  }
}




