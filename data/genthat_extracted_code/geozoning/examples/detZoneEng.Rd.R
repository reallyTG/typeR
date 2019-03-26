library(geozoning)


### Name: detZoneEng
### Title: detZoneEng
### Aliases: detZoneEng

### ** Examples

# load zoning results from test file
data(resZTest)
Z=resZTest$zonePolygone
zoneN=resZTest$zoneNModif
detZoneEng(3,Z,zoneN) # zone 2 englobes zone 3
detZoneEng(2,Z,zoneN) # no englobing zone for zone 2



