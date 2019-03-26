library(StMoMo)


### Name: plot.resStMoMo
### Title: Plot the residuals of a Stochastic Mortality Model
### Aliases: plot.resStMoMo

### ** Examples

CBDfit <- fit(cbd(), data = central2initial(EWMaleData), ages.fit = 55:89)
CBDres <- residuals(CBDfit)
plot(CBDres)
plot(CBDres, type = "signplot")
plot(CBDres, type = "colourmap")
  



