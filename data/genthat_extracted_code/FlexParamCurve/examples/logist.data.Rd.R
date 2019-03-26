library(FlexParamCurve)


### Name: logist.data
### Title: Simulated growth of whiskered terns
### Aliases: logist.data
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
#view data
logist.data
#create list for fixed parameters
modpar(logist.data$age, logist.data$mass, force4par = TRUE, pn.options = "myoptions")
plot(mass ~ age, data = logist.data, subset = id == "0.002",
     xlab = "Chick age (day)", las = 1,
     ylab = "Chick mass (g)",
     main = "logist.data and fitted curve (Chick #2 only)")
change.pnparameters(M=1, pn.options = "myoptions") # set curve to logistic (M=1) in subsequent fit
fm1 <- nls(mass ~ SSposnegRichards(age,Asym=Asym,K=K,Infl=Infl,
           modno=20, pn.options = "myoptions"),
           data = logist.data, subset = id == "0.002")
age <- seq(0, 166, length.out = 101)
lines(age, predict(fm1, list(age = age)))



