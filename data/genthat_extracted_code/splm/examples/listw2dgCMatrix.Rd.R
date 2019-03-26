library(splm)


### Name: listw2dgCMatrix
### Title: Interface between Matrix class objects and weights list
### Aliases: listw2dgCMatrix
### Keywords: spatial

### ** Examples

data(columbus, package="spdep")
listw<-nb2listw(col.gal.nb)
spW<-listw2dgCMatrix(listw)



