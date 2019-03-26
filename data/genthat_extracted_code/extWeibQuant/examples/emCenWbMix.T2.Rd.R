library(extWeibQuant)


### Name: emCenWbMix.T2
### Title: EM algorithm for the Type-II right censored Weibull Mixture with
###   two populations.
### Aliases: emCenWbMix.T2
### Keywords: Weibull mixture censor

### ** Examples

mmix = rbind(c(0.7, 5, 7),c(0.3, 15, 6))
vmix = c(mmix) #A vector version of the paramters
set.seed(1)
y <- sort(simWbMix(300, mmix)) #Generate the data
#The uncensored EM
emCenWbMix.T2(y, 300, iniParam=vmix, useC=TRUE)
#Type II censoring with the largest half of the data censored.
emCenWbMix.T2(y[1:150], 300, iniParam=vmix, useC=TRUE)



