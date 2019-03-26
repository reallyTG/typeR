library(psychotools)


### Name: infoplot
### Title: Information Plots for IRT Models
### Aliases: infoplot
### Keywords: aplot

### ** Examples

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit Rasch and partial credit model to verbal aggression data
rmmod <- raschmodel(VerbalAggression$resp2)
pcmod <- pcmodel(VerbalAggression$resp)

## category information plots for all items under the dichotomous RM
plot(rmmod, type = "information", what = "categories")

## category information plots for all items under the PCM
plot(pcmod, type = "information", what = "categories")

## overlayed item information plots for the first six items of the
## data set under the PCM
plot(pcmod, type = "information", what = "items", items = 1:6)

## a comparison of the item information for the first six items under the
## dichotomous RM and the PCM
plot(pcmod, type = "information", what = "items", items = 1:6,
  xlim = c(-5, 5))
plot(rmmod, type = "information", what = "items", items = 1:6,
  lty = 2, add = TRUE)
legend(x = "topright", legend = c("PCM", "RM"), lty = 1:2, bty = "n")

## a comparison of the test information based on all items of the
## data set under the dichotomous RM and the PCM
plot(pcmod, type = "information", what = "test", items = 1:6, xlim = c(-5, 5))
plot(rmmod, type = "information", what = "test", items = 1:6, lty = 2,
  add = TRUE)
legend(x = "topright", legend = c("PCM", "RM"), lty = 1:2, bty = "n")

if(requireNamespace("mirt")) {
## fit 2PL to verbal aggression data
twoplmod <- plmodel(VerbalAggression$resp2)

## category information plots for all items under the dichotomous 2PL
plot(twoplmod, type = "information", what = "categories")
}



