library(geozoning)


### Name: detZoneClose
### Title: detZoneClose
### Aliases: detZoneClose

### ** Examples

data(resZTest)
Z=resZTest$zonePolygone
zoneN=resZTest$zoneNModif
plotZ(Z)
detZoneClose(4,Z,zoneN) # zone 4 is close to zone 3
detZoneClose(6,Z,zoneN) # zone 6 is isolated (no zone at a distance smaller than 0.075).



