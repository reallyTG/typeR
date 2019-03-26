library(sphet)


### Name: listw2dgCMatrix
### Title: Interface between Matrix class objects and weights list
### Aliases: listw2dgCMatrix
### Keywords: spatial

### ** Examples

library(spdep)
data(columbus)
listw<-nb2listw(col.gal.nb)
spW<-listw2dgCMatrix(listw)



