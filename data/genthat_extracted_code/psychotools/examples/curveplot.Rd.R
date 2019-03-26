library(psychotools)


### Name: curveplot
### Title: Response Curve Plots for IRT Models
### Aliases: curveplot
### Keywords: aplot

### ** Examples

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit Rasch, rating scale and partial credit model to verbal aggression data
rmmod <- raschmodel(VerbalAggression$resp2)
rsmod <- rsmodel(VerbalAggression$resp)
pcmod <- pcmodel(VerbalAggression$resp)

## curve plots of the dichotomous RM
plot(rmmod, type = "curves")

## curve plots under the RSM for the first six items of the data set
plot(rsmod, type = "curves", items = 1:6)

## curve plots under the PCM for the first six items of the data set with
## custom labels
plot(pcmod, type = "curves", items = 1:6, names = paste("Item", 1:6))

## compare the predicted probabilities under the RSM and the PCM for a single
## item
plot(rsmod, type = "curves", item = 1)
plot(pcmod, type = "curves", item = 1, lty = 2, add = TRUE)
legend(x = "topleft", y = 1.0, legend = c("RSM", "PCM"), lty = 1:2, bty = "n")

if(requireNamespace("mirt")) {
## fit 2PL and generaliced partial credit model to verbal aggression data
twoplmod <- plmodel(VerbalAggression$resp2)
gpcmod <- gpcmodel(VerbalAggression$resp)

## curve plots of the dichotomous 2PL
plot(twoplmod, type = "curves", xlim = c(-6, 6))

## curve plots under the GPCM for the first six items of the data set
plot(gpcmod, type = "curves", items = 1:6, xlim = c(-6, 6))
}



