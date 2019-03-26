library(vegan)


### Name: mantel
### Title: Mantel and Partial Mantel Tests for Dissimilarity Matrices
### Aliases: mantel mantel.partial
### Keywords: multivariate htest

### ** Examples

## Is vegetation related to environment?
data(varespec)
data(varechem)
veg.dist <- vegdist(varespec) # Bray-Curtis
env.dist <- vegdist(scale(varechem), "euclid")
mantel(veg.dist, env.dist)
mantel(veg.dist, env.dist, method="spear")



