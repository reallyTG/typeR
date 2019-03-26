library(eRm)


### Name: person.parameter
### Title: Estimation of Person Parameters
### Aliases: person.parameter person.parameter.eRm summary.ppar print.ppar
###   plot.ppar coef.ppar logLik.ppar print.logLik.ppar confint.ppar
### Keywords: models

### ** Examples

#Person parameter estimation of a rating scale model
res <- RSM(rsmdat)
pres <- person.parameter(res)
pres
summary(pres)
plot(pres)

#Person parameter estimation for a Rasch model with missing values
res <- RM(raschdat2, se = FALSE) #Rasch model without standard errors
pres <- person.parameter(res)
pres                             #person parameters
summary(pres)
logLik(pres)                     #log-likelihood of person parameter estimation



