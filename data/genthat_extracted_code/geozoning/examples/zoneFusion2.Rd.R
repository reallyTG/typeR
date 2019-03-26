library(geozoning)


### Name: zoneFusion2
### Title: zoneFusion2 basic function for merging 2 zones
### Aliases: zoneFusion2

### ** Examples

data(resZTest)
Z=resZTest$zonePolygone
plotZ(Z)
sp::plot(zoneFusion2(Z[[6]],Z[[2]]),add=TRUE,col="blue")



