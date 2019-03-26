library(BPEC)


### Name: bpec.loadCoords
### Title: Load location data
### Aliases: bpec.loadCoords

### ** Examples


#to load existing example file from BPEC
coordsFile <- system.file("coordsLocsFile.txt",package = "BPEC")
coordsLocs <- bpec.loadCoords(coordsFile, header = TRUE)

## Not run: 
##D #to load a different input file "coordsLocs.txt"
##D coordsLocs <- bpec.loadCoords("coordsLocs.txt", header = TRUE)
## End(Not run)




