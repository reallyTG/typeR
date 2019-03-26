library(geozoning)


### Name: calFrame
### Title: calFrame
### Aliases: calFrame

### ** Examples

data(resZTest)
Z=resZTest$zonePolygone
zN=resZTest$zoneNModif
f=calFrame(6,Z,zN)
plotZ(Z)
rgeos::plot(f,add=TRUE,col="red")



