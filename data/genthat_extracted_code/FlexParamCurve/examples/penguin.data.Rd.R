library(FlexParamCurve)


### Name: penguin.data
### Title: Field data on growth of little penguins Eudyptula minor
### Aliases: penguin.data
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
#view data
penguin.data
modpar(penguin.data$ckage, penguin.data$weight, pn.options = "myoptions")
plot(weight ~ ckage, data = penguin.data, subset = bandid == penguin.data$bandid[1],
     xlab = "Chick age (day)", las = 1,
     ylab = "Chick mass (g)",
     main = "penguin.data and fitted curve (Chick #307 only)")
fm1 <- nls(weight ~ SSposnegRichards(ckage,Asym=Asym,K=K,Infl=Infl, RAsym=RAsym,
           modno=31, pn.options= "myoptions"),
           data = penguin.data, subset = bandid == penguin.data$bandid[1])
ckage <- seq(0, 74, length.out = 101)
lines(ckage, predict(fm1, list(ckage = ckage)))



