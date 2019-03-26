library(StMoMo)


### Name: m8
### Title: Create an M8 type extension of the Cairns-Blake-Dowd mortality
###   model
### Aliases: m8

### ** Examples


M8 <- m8(xc = 89)
wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
M8fit <- fit(M8, data = central2initial(EWMaleData), ages.fit = 55:89)
plot(M8fit, parametricbx = FALSE)




