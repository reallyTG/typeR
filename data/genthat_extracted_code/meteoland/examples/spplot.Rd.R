library(meteoland)


### Name: spplot
### Title: Spatial grid plots
### Aliases: spplot,SpatialGridTopography-method
###   spplot,SpatialGridMeteorology-method
###   spplot,SpatialPixelsTopography-method
###   spplot,SpatialPixelsMeteorology-method

### ** Examples

data(examplegridtopography)

#Display data
spplot(examplegridtopography, type="elevation", scales=list(draw=TRUE))
spplot(examplegridtopography, type="slope", scales=list(draw=TRUE))
spplot(examplegridtopography, type="aspect", scales=list(draw=TRUE))



