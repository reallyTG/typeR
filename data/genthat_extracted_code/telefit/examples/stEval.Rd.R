library(telefit)


### Name: stEval
### Title: Basic evaluation of fit
### Aliases: stEval

### ** Examples


data("coprecip")
data("coprecip.predict")

clim = rowMeans(coprecip$Y)
coprecip.predict = stEval(coprecip.predict, coprecip$Y, clim)




