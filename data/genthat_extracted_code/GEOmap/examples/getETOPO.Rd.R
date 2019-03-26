library(GEOmap)


### Name: getETOPO
### Title: Get Subset ETOPO Digital elevation map
### Aliases: getETOPO
### Keywords: misc

### ** Examples

library(geomapdata)

data(ETOPO5)

glat =c(45.4, 49)
glon = c(235, 243) 
b5 = getETOPO(ETOPO5, glat, glon)
image(x=attr(b5, 'lon'), y=attr(b5,'lat'), z=b5, col=terrain.colors(100) )
contour(   x=attr(b5, 'lon'), y=attr(b5,'lat'), z=b5, add=TRUE)




