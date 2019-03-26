library(blm)


### Name: Rsquared
### Title: Compute R-squared measures of model fit for 'blm' and 'lexpit'
###   objects.
### Aliases: Rsquared

### ** Examples


data(ccdata)

fit <- blm(y~female+packyear,data = ccdata,
			weight = ccdata$w, strata = ccdata$strata)

Rsquared(fit)



