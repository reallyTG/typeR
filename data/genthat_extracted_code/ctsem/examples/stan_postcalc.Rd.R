library(ctsem)


### Name: stan_postcalc
### Title: Compute functions of matrices from samples of a stanfit object
### Aliases: stan_postcalc

### ** Examples

temp<-stan_postcalc(stanfit=ctstantestfit$stanfit, 
  object='DRIFT', objectindices='all', calc='exp(object)')



