library(blm)


### Name: EO
### Title: Compute the ratio of expected event to observed events for 'blm'
###   and 'lexpit' objects.
### Aliases: EO

### ** Examples


data(ccdata)

fit <- blm(y~female+packyear,data = ccdata,
			weight = ccdata$w, strata = ccdata$strata)

EO(fit)

EO(fit, ccdata$strata) # BY FACTOR



