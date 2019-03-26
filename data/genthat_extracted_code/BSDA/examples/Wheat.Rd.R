library(BSDA)


### Name: Wheat
### Title: Price of a bushel of wheat versus the national weekly earnings
###   of production workers
### Aliases: Wheat
### Keywords: datasets

### ** Examples


par(mfrow = c(1, 2))
plot(earnings ~ year, data = Wheat)
plot(price ~ year, data = Wheat)
par(mfrow = c(1, 1))




