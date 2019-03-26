library(extWeibQuant)


### Name: cenWbMLE.T1
### Title: censored Weibull MLE for Type I right-censored data
### Aliases: cenWbMLE cenWbMLE.T1
### Keywords: censor Weibull subjective censoring

### ** Examples

set.seed(1)
y <- sort(rweibull(100, 7, 7)) ##Generate the data
cenWbMLE.T1(y) #The MLE for the complete data
cenWbMLE.T1(y, 5) #Censor the data at 5 and calculate the censored MLE
##Or
newy <- rep(NA, 100)
newy[y<=5] <- y[y<=5] #Censor the data at 5
fit <- cenWbMLE.T1(newy, 5) #Calculate the censored MLE
qweibull(0.05, fit$estimates[1], fit$estimates[2]) 
#Calculate the 5% quantile of the fitted distribution.



