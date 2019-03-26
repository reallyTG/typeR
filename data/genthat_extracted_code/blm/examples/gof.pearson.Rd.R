library(blm)


### Name: gof.pearson
### Title: Pearson's goodness-of-fit statistics for 'blm' and 'lexpit'
###   objects.
### Aliases: gof.pearson

### ** Examples


data(ccdata)

fit <- blm(y~female+I(packyear>20),data = ccdata,
			weight = ccdata$w, strata = ccdata$strata)

gof.pearson(fit)




