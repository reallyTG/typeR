library(extWeibQuant)


### Name: emCenWbMix.T1
### Title: EM algorithm for the Type-I right censored Weibull Mixture with
###   two populations.
### Aliases: emCenWbMix emCenWbMix.T1
### Keywords: Weibull mixture censor

### ** Examples

mmix = rbind(c(0.7, 5, 7),c(0.3, 15, 6))
vmix = c(mmix) #A vector version of the paramters
set.seed(1)
y <- sort(simWbMix(300, mmix)) #Generate the data
#The uncensored mixture
emCenWbMix.T1(y, iniParam=vmix, useC=TRUE)
#The mixture if we censor the data around 9.
emCenWbMix.T1(y, Cx=9, iniParam=vmix, useC=TRUE) 



