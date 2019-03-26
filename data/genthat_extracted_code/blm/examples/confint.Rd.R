library(blm)


### Name: confint
### Title: Confidence intervals for parameters of 'blm' and 'lexpit'
###   objects.
### Aliases: confint.blm confint,blm-method confint,lexpit-method
### Keywords: methods

### ** Examples


data(ccdata)

fit <- lexpit(y~female, y~packyear, data = ccdata,
       			weight = ccdata$w, strata = ccdata$strata)

confint(fit)



