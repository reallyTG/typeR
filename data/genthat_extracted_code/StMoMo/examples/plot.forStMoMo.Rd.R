library(StMoMo)


### Name: plot.forStMoMo
### Title: Plot a forecast from a Stochastic Mortality Model
### Aliases: plot.forStMoMo

### ** Examples

wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
APCfit <- fit(apc(), data = EWMaleData, ages.fit = 55:89, wxt = wxt)
APCfor <- forecast(APCfit)
plot(APCfor)
plot(APCfor, parametricbx = FALSE, nCol = 3)
plot(APCfor, only.kt = TRUE)
plot(APCfor, only.gc = TRUE, lwd = 2)



