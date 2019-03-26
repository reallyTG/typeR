library(blm)


### Name: summary
### Title: Summary of 'blm' and 'lexpit' model fit.
### Aliases: summary.blm summary,blm-method summary,lexpit-method
### Keywords: methods

### ** Examples


data(ccdata)

fit <- blm(y~female+packyear,data = ccdata,
			weight = ccdata$w, strata = ccdata$strata)

summary(fit)

fit.lexpit <- lexpit(y~female, y~packyear,data = ccdata,
			weight = ccdata$w, strata = ccdata$strata)

summary(fit.lexpit)





