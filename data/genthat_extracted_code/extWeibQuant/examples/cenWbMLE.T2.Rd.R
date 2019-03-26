library(extWeibQuant)


### Name: cenWbMLE.T2
### Title: censored Weibull MLE for Type II right-censored data
### Aliases: cenWbMLE.T2
### Keywords: censor Weibull subjective censoring

### ** Examples

set.seed(1)
y <- sort(rweibull(100, 7, 7)) ##Generate the data
cenWbMLE.T2(y, 100) #The MLE for the complete data
cenWbMLE.T2(y[1:10], 100) #Censor the largerst 90% of the data.



