library(BiodiversityR)


### Name: distdisplayed
### Title: Compare Distance Displayed in Ordination Diagram with Distances
###   of Distance Matrix
### Aliases: distdisplayed
### Keywords: multivariate

### ** Examples

library(vegan)
library(mgcv)
data(dune)
distmatrix <- vegdist(dune,method="kulc")
ordination.model1 <- cmdscale(distmatrix,k=2)
ordiplot1 <- ordiplot(ordination.model1)
distdisplayed(dune,ordiplot=ordiplot1,distx="kulc",plotit=TRUE,
    method="spearman",permutations=100,gam=TRUE)



