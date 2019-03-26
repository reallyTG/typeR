library(StMoMo)


### Name: cbd
### Title: Create a Cairns-Blake-Dowd mortality model
### Aliases: cbd

### ** Examples


CBD <- cbd()
CBDfit <- fit(CBD, data = central2initial(EWMaleData), ages.fit = 55:89)
plot(CBDfit, parametricbx = FALSE)




