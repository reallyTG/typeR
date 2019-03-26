library(GeoRange)


### Name: PWMatrix
### Title: Creates a sparse pairwise distance matrix of a coordinate set
### Aliases: PWMatrix

### ** Examples

longs<-runif(10,-22,33)
lats<-runif(10,-22,33)
Coords<-CoordCollapse(longs,lats)
PWMatrix(Coords)



