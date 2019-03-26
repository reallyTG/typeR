library(telefit)


### Name: stVIF
### Title: Computes variance inflation factors for fixed effects of the
###   teleconnection model
### Aliases: stVIF

### ** Examples


data("coprecip")
data("coprecip.fit")

stVIF(stData = coprecip, stFit = coprecip.fit, burn = 50)




