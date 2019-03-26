library(sp)


### Name: flip
### Title: rearrange data in SpatialPointsDataFrame or SpatialGridDataFrame
###   for plotting with spplot (levelplot/xyplot wrapper)
### Aliases: flipHorizontal flipVertical
### Keywords: dplot

### ** Examples

data(meuse.grid) # data frame
gridded(meuse.grid) = c("x", "y") # promotes to 
fullgrid(meuse.grid) = TRUE
d = meuse.grid["dist"]
image(d, axes=TRUE)
image(flipHorizontal(d), axes=TRUE)
image(flipVertical(d), axes=TRUE)



