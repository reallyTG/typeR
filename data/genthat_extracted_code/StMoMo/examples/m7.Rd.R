library(StMoMo)


### Name: m7
### Title: Create an M7 type extension of the Cairns-Blake-Dowd mortality
###   model
### Aliases: m7

### ** Examples


M7 <- m7()
wxt <- genWeightMat(55:89,  EWMaleData$years, clip = 3)
M7fit <- fit(M7, data = central2initial(EWMaleData), ages.fit = 55:89)
plot(M7fit, parametricbx = FALSE)




