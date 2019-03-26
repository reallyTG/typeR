library(GeneralizedHyperbolic)


### Name: gigParam
### Title: Parameter Sets for the Generalized Inverse Gaussian Distribution
### Aliases: gigParam gigSmallParam gigLargeParam

### ** Examples

data(gigParam)
## Check values of chi and psi
plot(gigLargeParam[, 1], gigLargeParam[, 2])
### Check all three parameters
pairs(gigLargeParam,
  labels = c(expression(chi),expression(psi),expression(lambda)))

## Testing the accuracy of gigMean
for (i in 1:nrow(gigSmallParam)) {
  param <- gigSmallParam[i, ]
  x <- rgig(1000, param = param)
  sampleMean <- mean(x)
  funMean <- gigMean(param = param)
  difference <- abs(sampleMean - funMean)
  print(difference)
}




