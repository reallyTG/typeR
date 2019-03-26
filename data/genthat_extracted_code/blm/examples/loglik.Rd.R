library(blm)


### Name: logLik
### Title: Log-likelihood of 'blm' and 'lexpit' objects.
### Aliases: logLik.blm logLik,blm-method logLik,lexpit-method
### Keywords: methods

### ** Examples


data(ccdata)

fit <- lexpit(y~female, y~packyear, data = ccdata,
       			weight = ccdata$w, strata = ccdata$strata)

logLik(fit)

AIC(fit)



