library(SDraw)


### Name: WA
### Title: SpatialPolygonsDataFrame for the state of Washington, USA
### Aliases: WA

### ** Examples

plot(WA[WA$LAND_TYPE == "MAINLAND",], col="red")
plot(WA[WA$LAND_TYPE == "ISLAND",], col="blue",add=TRUE)
plot(WA[WA$LAND_TYPE == "OCEAN",], col="turquoise",add=TRUE)



