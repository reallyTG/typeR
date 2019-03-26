library(extWeibQuant)


### Name: bootstrapCenWbMix
### Title: Bootstrap Censored Weibull Mixture for censoring threshold
###   selection and standard error of the quantile estimates
### Aliases: bootstrapCenWbMix
### Keywords: Bootstrap Threshold selection Weibull Mixture Censor

### ** Examples

###
mmix = rbind(c(0.7, 5, 7),c(0.3, 15, 6))
vmix = c(mmix) #A vector version of the paramters
set.seed(1)
y <- sort(simWbMix(100, mmix)) #Generate Data
#Run the EM for 70% Type II censoring
mix70 <- emCenWbMix.T2(y[1:70], 100, iniParam=vmix, useC=TRUE)
#Run the EM for the complete data set
mix100<- emCenWbMix.T2(y, 100, iniParam=vmix, useC=TRUE)
#Use bootstrap with the previous estimates as initials
bootstrapCenWbMix(y, canSet=c(0.7, 1), 
		iniVec=c(c(mix70$estimates), c(mix100$estimates)), B=5,randSeed=1)
#Or use the "true" value as the initials.
bootstrapCenWbMix(y, canSet=c(0.7, 1), iniVec=c(vmix, vmix), B=5,randSeed=1)
#B=5 is just for illustration. It should be at least 1000.



