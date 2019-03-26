library(R2BayesX)


### Name: Interface between nb and gra format
### Title: Convert nb and gra format into each other
### Aliases: nb2gra gra2nb
### Keywords: spatial

### ** Examples

## first nb to gra:
if(requireNamespace("spdep") &
  requireNamespace("rgdal") &
  requireNamespace("spData")) {
  library("spdep")
  library("spData")
  library("rgdal")

  columbus <- readOGR(system.file("shapes/columbus.shp", package="spData")[1])

  colNb <- poly2nb(columbus)

  ## ... here manual editing is possible ...
  ## then export to graph format
  colGra <- nb2gra(colNb)

  ## and save in BayesX file
  graFile <- tempfile()
  write.gra(colGra, file=graFile)

  ## now back from gra to nb:
  colGra <- read.gra(graFile)
  newColNb <- gra2nb(colGra)
  newColNb

  ## compare this with the original
  colNb

  ## only the call attribute does not match (which is OK):
  all.equal(newColNb, colNb, check.attributes = FALSE)
  attr(newColNb, "call")
  attr(colNb, "call")
}



