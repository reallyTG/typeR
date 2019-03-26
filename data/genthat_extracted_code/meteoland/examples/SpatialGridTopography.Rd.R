library(meteoland)


### Name: SpatialGridTopography
### Title: Creates a 'SpatialGridTopography'
### Aliases: SpatialGridTopography

### ** Examples

data(examplegridtopography)

#Display data
spplot(examplegridtopography, variable="elevation", scales=list(draw=TRUE))

#Grids can be subsetted
sgt = examplegridtopography[1:50, 1:50]
spplot(sgt, variable="elevation", scales=list(draw=TRUE))




