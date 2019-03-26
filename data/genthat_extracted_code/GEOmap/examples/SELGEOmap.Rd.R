library(GEOmap)


### Name: SELGEOmap
### Title: Select parts of a GEOmap
### Aliases: SELGEOmap
### Keywords: misc

### ** Examples

library(geomapdata)
data(worldmap)
skam = SELGEOmap(worldmap, ncut=3, acut=c(10000, Inf), proj=NULL, LIM=NULL)

par(mfrow=c(2,1))

#######  plot world map, with all lines:
plotGEOmap(worldmap)
length(worldmap$STROKES$num)
######   same plot with some lines removed:
plotGEOmap(skam)
length(skam$STROKES$num)

#####################
#####################




