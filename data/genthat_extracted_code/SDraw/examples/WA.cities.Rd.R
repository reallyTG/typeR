library(SDraw)


### Name: WA.cities
### Title: SpatialPointsDataFrame of cities in Washington state, USA
### Aliases: WA.cities

### ** Examples

max.popln <- max(WA.cities$POP_2010)
plot(WA.cities, pch=16, cex=5*WA.cities$POP_2010/max.popln, col="red" )




