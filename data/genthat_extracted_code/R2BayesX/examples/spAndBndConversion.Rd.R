library(R2BayesX)


### Name: Interface between sp and bnd format
### Title: Convert sp and bnd format into each other
### Aliases: sp2bnd bnd2sp
### Keywords: spatial

### ** Examples

## bnd to sp:
file <- file.path(find.package("R2BayesX"), "examples", "Germany.bnd")
germany <- read.bnd(file)
spGermany <- bnd2sp(germany)

## plot the result together with the neighborhood graph
if(requireNamespace("spdep")) {
  library("spdep")
  plot(spGermany)
  nbGermany <- poly2nb(spGermany)
  plot(nbGermany, coords = coordinates(spGermany), add = TRUE)

  ## example with one region inside another
  spExample <- spGermany[c("7231", "7235"), ]
  plot(spExample)
  plot(poly2nb(spExample), coords = coordinates(spExample), add = TRUE)

  ## now back from sp to bnd:
  bndGermany <- sp2bnd(spGermany)
  plotmap(bndGermany)

  ## compare names and number of polygons
  stopifnot(
    identical(names(bndGermany), names(germany)),
    identical(length(bndGermany), length(germany))
  )
}



