library(StMoMo)


### Name: residuals.fitStMoMo
### Title: Extract deviance residuals of a Stochastic Mortality Model
### Aliases: residuals.fitStMoMo

### ** Examples

CBDfit <- fit(cbd(), data = central2initial(EWMaleData), ages.fit = 55:89)
CBDres <- residuals(CBDfit)
plot(CBDres)



