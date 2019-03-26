library(IceCast)


### Name: extractCoords
### Title: Function to extract coordinates.
### Aliases: extractCoords

### ** Examples

coords <- extractCoords(regionInfo$regions[[3]])
par(mfrow = c(1, 2))
plot(regionInfo$regions[[3]], main = "Polygon Object")
plot(coords, type = "p", main = "Coordinates", pch = 20)



