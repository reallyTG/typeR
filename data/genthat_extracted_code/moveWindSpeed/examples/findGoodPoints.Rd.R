library(moveWindSpeed)


### Name: findGoodPoints
### Title: Function to find good points for estimation of phi
### Aliases: findGoodPoints

### ** Examples

data(storks)
which(findGoodPoints( storks[[2]],
windowSize = 29,  isSamplingRegular = 1,
isThermallingFunction = getDefaultIsThermallingFunction(360, 4),  maxPointsToUseInEstimate = 10,
phiInitialEstimate = 0  ))



