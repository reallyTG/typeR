library(StMoMo)


### Name: plot.fitStMoMo
### Title: Plot fitted parameters from a stochastic mortality model
### Aliases: plot.fitStMoMo

### ** Examples


#Fit and plot a Lee-Carter model
LCfit <- fit(lc(), data = EWMaleData, ages.fit = 55:89)
plot(LCfit)
plot(LCfit, type = "p", pch = 19)

#Fit and plot a CBD model
CBDfit <- fit(cbd(), data = central2initial(EWMaleData), ages.fit = 55:89)
plot(CBDfit)
plot(CBDfit, parametricbx = FALSE)
plot(CBDfit, nCol = 1, parametricbx = FALSE, lwd = 2)




