library(ctsem)


### Name: stan_confidenceRegion
### Title: Extract functions of multiple variables from a stanfit object
### Aliases: stan_confidenceRegion

### ** Examples

temp<-stan_confidenceRegion(stanfit=ctstantestfit$stanfit, 
  parstrings=c('pop_DRIFT[1,2]','pop_DRIFT[2,1]'))
t(apply(temp,2,quantile))



