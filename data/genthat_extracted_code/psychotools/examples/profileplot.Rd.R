library(psychotools)


### Name: profileplot
### Title: Profile Plots for IRT Models
### Aliases: profileplot
### Keywords: aplot

### ** Examples

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit Rasch, rating scale and partial credit model to verbal aggression data
rmmod <- raschmodel(VerbalAggression$resp2)
rsmod <- rsmodel(VerbalAggression$resp)
pcmod <- pcmodel(VerbalAggression$resp)

## profile plots of the item parameters of the three fitted IRT models
plot(rmmod, type = "profile", what = "items", col = 4)
plot(rsmod, type = "profile", what = "items", col = 2, add = TRUE)
plot(pcmod, type = "profile", what = "items", col = 3, add = TRUE)
legend(x = "topleft", legend = c("RM", "RSM", "PCM"), col = 1,
  bg = c(4, 2, 3), pch = 21, bty = "n")

## profile plots of the threshold parameters of type "mode"
plot(rmmod, type = "profile", what = "thresholds", parg = list(type = "mode"))
plot(rsmod, type = "profile", what = "thresholds", parg = list(type = "mode"))
plot(pcmod, type = "profile", what = "thresholds", parg = list(type = "mode"))

## profile plot of the discrimination parameters of the dichotomous RM
plot(rmmod, type = "profile", what = "discrimination")

if(requireNamespace("mirt")) {
## fit 2PL and generalized partial credit model to verbal aggression data
twoplmod <- plmodel(VerbalAggression$resp2)
gpcmod <- gpcmodel(VerbalAggression$resp)

## profile plot of the discrimination parameters of a dichotomous 2PL
plot(twoplmod, type = "profile", what = "discrimination")

## profile plot of the item parameters of the 2PL and GPCM
plot(twoplmod, type = "profile", what = "items", col = 4)
plot(gpcmod, type = "profile", what = "items", col = 2, add = TRUE)
}



