library(StMoMo)


### Name: central2initial
### Title: Transform StMoMoData from central to initial exposures
### Aliases: central2initial

### ** Examples


CBD <- cbd()
CBDfit <- fit(CBD, data = central2initial(EWMaleData), ages.fit = 55:89)
plot(CBDfit, parametricbx = FALSE)




