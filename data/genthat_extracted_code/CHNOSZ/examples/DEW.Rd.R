library(CHNOSZ)


### Name: DEW
### Title: Deep Earth Water (DEW) Model
### Aliases: DEW calculateDensity calculateGibbsOfWater calculateEpsilon
###   calculateQ

### ** Examples

pressure <- c(1000, 60000)
temperature <- c(100, 1000)
calculateGibbsOfWater(pressure, temperature)
(density <- calculateDensity(pressure, temperature))
calculateEpsilon(density, temperature)
calculateQ(density, temperature)



