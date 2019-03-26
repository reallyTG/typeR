library(IceCast)


### Name: rmHoles
### Title: Remove holes in a polygon
### Aliases: rmHoles

### ** Examples

withHoles <- bgWater[2]
plot(withHoles, col = "blue", main = "Polygon with Holes")
noHoles <- rmHoles(withHoles)
plot(noHoles, col = "blue", main = "Holes removed")



