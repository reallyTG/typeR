library(FlexParamCurve)


### Name: posneg.data
### Title: Simulated growth of black-browed albatrosses
### Aliases: posneg.data
### Keywords: datasets

### ** Examples

require(stats); require(graphics)
#view data
posneg.data
#create list for fixed parameters
modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")
plot(mass ~ age, data = posneg.data, subset = id == "1",
     xlab = "Chick age (day)", las = 1,
     ylab = "Chick mass (g)",
     main = "posneg.data data and fitted curve (Chick #1 only)")
fm1 <- nls(mass ~ SSposnegRichards(age,Asym=Asym,K=K,Infl=Infl, RAsym=RAsym,
           Rk=Rk,Ri=Ri,modno=22, pn.options= "myoptions"),
           data = posneg.data, subset = id == "1")
age <- seq(0, 166, length.out = 101)
lines(age, predict(fm1, list(age = age)))



