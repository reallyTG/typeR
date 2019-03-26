library(geozoning)


### Name: calGearyLoc
### Title: local Geary criteria
### Aliases: calGearyLoc

### ** Examples

K=resZTest
zoneA=sapply(K$zonePolygone,rgeos::gArea)
calGearyLoc(K$zoneNModif,K$meanZone,K$meanTot,zoneA)



