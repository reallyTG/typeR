library(telefit)


### Name: coef.stPredict
### Title: Compute point estimates for parameters from posterior samples
### Aliases: coef.stPredict

### ** Examples


data("coprecip")
data("coprecip.fit")
data("coprecip.predict")

coef(coprecip.predict, stFit = coprecip.fit, stData = coprecip, burn = 50)
 



