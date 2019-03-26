library(clinDR)


### Name: nllogis
### Title: The negative log likelihood function for a 3- or 4- parameter
###   Emax model on the logit scale for binary dose response.
### Aliases: nllogis
### Keywords: nonlinear

### ** Examples

data(examples14)
with(examples14[[8]],nllogis(parms=c(log(.17),-3.26,-0.15), y, dose))



