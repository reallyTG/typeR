library(adehabitatHS)


### Name: mahasuhab
### Title: Habitat Suitability Mapping with Mahalanobis Distances.
### Aliases: mahasuhab
### Keywords: spatial multivariate

### ** Examples

## loads the data
data(lynxjura)
ma <- lynxjura$map
lo <- lynxjura$locs[,1:2]

## We first scale the maps
slot(ma, "data") <- dudi.pca(slot(ma, "data"), scannf=FALSE)$tab

## habitat suitability mapping
hsm <- mahasuhab(ma, lo, type = "probability")
image(hsm)
title(main = "Habitat suitability map for the Lynx")
points(lo, pch = 3)




