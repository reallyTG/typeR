library(devRate)


### Name: devRateMap
### Title: Predict development rate from a matrix of temperatures
### Aliases: devRateMap

### ** Examples

myT <- 5:15
myDev <- -0.05 + rnorm(n = length(myT), mean = myT, sd = 1) * 0.01
myNLS <- devRateModel(eq = campbell_74, temp = myT, devRate = myDev,
  startValues = list(aa = 0, bb = 0))
myMap <- devRateMap(nlsDR =  myNLS, tempMap = matrix(rnorm(100, mean = 12, sd = 2), ncol=10))



