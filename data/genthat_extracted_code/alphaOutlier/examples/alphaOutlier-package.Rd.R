library(alphaOutlier)


### Name: alphaOutlier-package
### Title: Obtain alpha-outlier regions for well-known probability
###   distributions
### Aliases: alphaOutlier-package alphaOutlier
### Keywords: package distribution robust

### ** Examples


iris.setosa <- iris[1:51, 4]
aout.norm(data = iris.setosa, param = c(mean(iris.setosa), sd(iris.setosa)), alpha = 0.01)
aout.pois(data = warpbreaks[,1], param = mean(warpbreaks[,1]), alpha = 0.01, 
          hide.outliers = TRUE)



