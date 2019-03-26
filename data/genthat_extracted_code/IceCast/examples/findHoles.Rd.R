library(IceCast)


### Name: findHoles
### Title: Find holes in a polygon
### Aliases: findHoles

### ** Examples

holeEx <- findHoles(regionInfo$regions[[1]], regionInfo$regions[[1]], regionInfo$out[[1]])
plot(holeEx$newPoly)
plot(holeEx$holes, col = "red", add = TRUE)



