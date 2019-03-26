library(FlexParamCurve)


### Name: tern.data
### Title: Field data on growth of common terns Sterna hirundo
### Aliases: tern.data
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
#view data
tern.data
#create pnmodelparams for fixed parameters
modpar(tern.data$ckage, tern.data$weight, force4par = TRUE, pn.options = "myoptions")
plot(weight ~ ckage, data = tern.data, subset = bandid == tern.data$bandid[1],
     xlab = "Chick age (day)", las = 1,
     ylab = "Chick mass (g)",
     main = "tern.data and fitted curve (Chick #156 only)")
fm1 <- nls(weight ~ SSposnegRichards(ckage,Asym=Asym,K=K,Infl=Infl,modno=32,
           pn.options= "myoptions"),
           data = tern.data, subset = bandid == tern.data$bandid[1])
ckage <- seq(0, 30, length.out = 101)
lines(ckage, predict(fm1, list(ckage = ckage)))



