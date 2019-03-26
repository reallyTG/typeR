library(LPCM)


### Name: gvessel
### Title: North Atlantic Water Temperature Data.
### Aliases: gvessel
### Keywords: datasets

### ** Examples

data(gvessel)
pairs(gvessel[,c(3,2,4,5)])
tcol <- (gvessel$tempg- min(gvessel$tempg))/(max(gvessel$tempg)- min(gvessel$tempg))
require(scatterplot3d)
scatterplot3d(gvessel[,2],gvessel[,4],gvessel[,5], color=rgb(tcol,0,1-tcol))



