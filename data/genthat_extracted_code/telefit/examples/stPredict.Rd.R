library(telefit)


### Name: stPredict
### Title: Compute forecasts based on posterior samples
### Aliases: stPredict

### ** Examples

set.seed(2018)
  
data("coprecip")
data("coprecip.fit")

coprecip.predict = stPredict(stFit = coprecip.fit, stData = coprecip, 
                             stDataNew = coprecip, burn = 90, 
                             returnFullAlphas = FALSE)



