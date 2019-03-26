library(SkewHyperbolic)


### Name: skewhypParam
### Title: Parameter Sets for the Skew Hyperbolic t-Distribution
### Aliases: skewhypSmallShape skewhypLargeShape skewhypSmallParam
###   skewhypLargeParam

### ** Examples

data(skewhypParam)
### Testing the accuracy of skewhypMean
for (i in 1:nrow(skewhypSmallParam)) {
  param <- skewhypSmallParam[i, ]
  x <- rskewhyp(1000, param = param)
  sampleMean <- mean(x)
  distMean <- skewhypMean(param = param)
  difference <- abs(sampleMean - distMean)
  print(difference)
}




