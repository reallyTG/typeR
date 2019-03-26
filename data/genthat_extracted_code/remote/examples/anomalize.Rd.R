library(remote)


### Name: anomalize
### Title: Create an anomaly RasterStack
### Aliases: anomalize

### ** Examples

data(australiaGPCP)

aus_anom <- anomalize(australiaGPCP)

opar <- par(mfrow = c(1,2))
plot(australiaGPCP[[10]], main = "original")
plot(aus_anom[[10]], main = "anomalized")
par(opar)



