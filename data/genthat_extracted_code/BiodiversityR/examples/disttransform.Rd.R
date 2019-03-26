library(BiodiversityR)


### Name: disttransform
### Title: Community Matrix Transformation
### Aliases: disttransform
### Keywords: multivariate

### ** Examples

library(vegan)
data(dune)
Community.1 <- disttransform(dune, method='hellinger')
Distmatrix.1 <- vegdist(Community.1,method='euclidean')
Distmatrix.1



