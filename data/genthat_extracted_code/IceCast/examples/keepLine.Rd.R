library(IceCast)


### Name: keepLine
### Title: Keep only spatial lines
### Aliases: keepLine

### ** Examples

par(mfrow = c(1, 2))
plot(spatialCollEx, col = "blue", main = "Spatial Collections Object")
lineOnly <- keepLine(spatialCollEx)
plot(lineOnly, col = "blue", main = "Spatial Line Only")



