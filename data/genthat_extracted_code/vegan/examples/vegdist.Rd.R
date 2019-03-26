library(vegan)


### Encoding: UTF-8

### Name: vegdist
### Title: Dissimilarity Indices for Community Ecologists
### Aliases: vegdist
### Keywords: multivariate

### ** Examples

data(varespec)
vare.dist <- vegdist(varespec)
# Orlóci's Chord distance: range 0 .. sqrt(2)
vare.dist <- vegdist(decostand(varespec, "norm"), "euclidean")
# Anderson et al.  (2006) version of Gower
vare.dist <- vegdist(decostand(varespec, "log"), "altGower")
# Range standardization with "altGower" (that excludes double-zeros)
vare.dist <- vegdist(decostand(varespec, "range"), "altGower")



