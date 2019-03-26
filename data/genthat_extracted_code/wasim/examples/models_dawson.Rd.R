library(wasim)


### Name: models_dawson
### Title: Synthetic peak errors from Dawson 2007
### Aliases: models_dawson
### Keywords: datasets

### ** Examples

data(models_dawson)
plot(models_dawson[,1])
lines(models_dawson[,2])
diagnostic_dawson(modelled=models_dawson[,2], measured=models_dawson[,1], use_qualV=TRUE)
do.call(rbind,lapply(models_dawson,FUN=diagnostic_dawson, measured=models_dawson[,1]))



