library(spData)


### Name: afcon
### Title: Spatial patterns of conflict in Africa 1966-78
### Aliases: afcon africa.rook.nb afxy paper.nb
### Keywords: datasets spdep

### ** Examples

data(afcon)
if (!requireNamespace("spdep", quietly = TRUE)) {
  library(spdep)
  plot(africa.rook.nb, afxy)
  plot(diffnb(paper.nb, africa.rook.nb), afxy, col="red", add=TRUE)
  text(afxy, labels=attr(africa.rook.nb, "region.id"), pos=4, offset=0.4)
  moran.test(afcon$totcon, nb2listw(africa.rook.nb))
  moran.test(afcon$totcon, nb2listw(paper.nb))
  geary.test(afcon$totcon, nb2listw(paper.nb))
}



