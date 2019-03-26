library(remote)


### Name: deseason
### Title: Create seasonal anomalies
### Aliases: deseason deseason,RasterStackBrick-method
###   deseason,numeric-method

### ** Examples

data("australiaGPCP")

aus_dsn <- deseason(australiaGPCP, 12)

opar <- par(mfrow = c(1,2))
plot(australiaGPCP[[1]], main = "original")
plot(aus_dsn[[1]], main = "deseasoned")
par(opar)



