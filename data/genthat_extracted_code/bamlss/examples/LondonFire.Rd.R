library(bamlss)


### Name: LondonFire
### Title: London Fire Data
### Aliases: LondonFire LondonBoroughs LondonBoundaries LondonFStations
### Keywords: datasets

### ** Examples

data("LondonFire")
plot(LondonFire, col = "red")
plot(LondonFStations, col = "blue", cex = 1.5, pch = 16, add = TRUE)
plot(LondonBoroughs, lwd = 0.5, add = TRUE)
plot(LondonBoundaries, add = TRUE, lwd = 1.5)
head(LondonFire@data)



