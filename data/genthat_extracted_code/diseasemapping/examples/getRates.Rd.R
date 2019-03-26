library(diseasemapping)


### Name: getRates
### Title: Calculate the estimated coefficients of age and sex group from
###   the glm model
### Aliases: getRates

### ** Examples


data('casedata')
data('popdata')
therates = getRates(casedata, popdata, ~sex*age,
	breaks=c(seq(0, 80, by=10), Inf))
therates




