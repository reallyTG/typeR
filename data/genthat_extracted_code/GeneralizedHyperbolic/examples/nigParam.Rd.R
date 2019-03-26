library(GeneralizedHyperbolic)


### Name: nigParam
### Title: Parameter Sets for the Normal Inverse Gaussian Distribution
### Aliases: nigParam nigSmallShape nigLargeShape nigSmallParam
###   nigLargeParam

### ** Examples

data(nigParam)
plotShapeTriangle()
xis <- rep(c(0.1,0.3,0.5,0.7,0.9), 1:5)
chis <- c(0,-0.25,0.25,-0.45,0,0.45,-0.65,-0.3,0.3,0.65,
          -0.85,-0.4,0,0.4,0.85)
points(chis, xis, pch = 20, col = "red")


## Testing the accuracy of nigMean
for (i in 1:nrow(nigSmallParam)) {
  param <- nigSmallParam[i, ]
  x <- rnig(1000, param = param)
  sampleMean <- mean(x)
  funMean <- nigMean(param = param)
  difference <- abs(sampleMean - funMean)
  print(difference)
}




