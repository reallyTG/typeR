library(StMoMo)


### Name: m6
### Title: Create an M6 type extension of the Cairns-Blake-Dowd mortality
###   model
### Aliases: m6

### ** Examples


M6 <- m6()
wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
M6fit <- fit(M6, data = central2initial(EWMaleData), ages.fit = 55:89)
plot(M6fit, parametricbx = FALSE)




