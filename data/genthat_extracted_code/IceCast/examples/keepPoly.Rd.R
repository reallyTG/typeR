library(IceCast)


### Name: keepPoly
### Title: Keep only spatial polygons
### Aliases: keepPoly

### ** Examples

par(mfrow = c(1, 2))
plot(spatialCollEx, col = "blue", main = "Spatial Collections Object")
polyOnly <- keepPoly(spatialCollEx)
plot(polyOnly, col = "blue", main = "Spatial Polygon Only")



