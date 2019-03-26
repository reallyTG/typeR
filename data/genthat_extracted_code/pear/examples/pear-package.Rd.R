library(pear)


### Name: pear-package
### Title: Periodic Autoregression Model Fitting
### Aliases: pear-package
### Keywords: ts package

### ** Examples

#We will work with the log flows
data(Fraser)
logFraser <- log(Fraser)
#Example 1. Periodic autocorrelations
#plot and output including portmanteau and periodicity test
#as well as means, sd, autocorrelations
peacf(logFraser)
#
#Example 2. Periodic boxplot
peboxplot(logFraser)
#
#Example 3. Periodic pacf
pepacf(logFraser)
#
#Example 4. Fit pear using BIC
ans<-pepacf(logFraser)
#list output variables
names(ans)
#the model orders selected for each month are:
ans$mbice
#now fit with pear
ans <- pear(logFraser, ic="bic")




