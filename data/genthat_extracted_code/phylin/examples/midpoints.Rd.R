library(phylin)


### Name: midpoints
### Title: Midpoints between pairs of coordinates
### Aliases: midpoints
### Keywords: variogram kriging

### ** Examples


data(vipers)
mp <- midpoints(vipers[,1:2], all=TRUE) 
# With 'all=FALSE' (Delaunay triang.), package 'geometry' is mandatory.




