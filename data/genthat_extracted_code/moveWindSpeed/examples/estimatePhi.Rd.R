library(moveWindSpeed)


### Name: estimatePhi
### Title: estimatePhi
### Aliases: estimatePhi

### ** Examples

data(storks)
estimatePhi(
  storks[[2]],
  windowSize = 19,
  isSamplingRegular = 1,
  isThermallingFunction = getDefaultIsThermallingFunction(360, 4),
  maxPointsToUseInEstimate = 10
)



