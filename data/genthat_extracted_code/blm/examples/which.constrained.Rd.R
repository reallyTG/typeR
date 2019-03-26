library(blm)


### Name: which.at.boundary
### Title: Covariate patterns at the boundary for 'blm' and 'lexpit'
###   objects.
### Aliases: which.at.boundary

### ** Examples


data(ccdata)

fit <- blm(y~female+packyear,data = ccdata,
			weight = ccdata$w, strata = ccdata$strata)

which.at.boundary(fit)




