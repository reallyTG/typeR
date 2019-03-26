library(kernhaz)


### Name: khazardcond
### Title: Kernel estimate of conditional hazard function for
###   right-censored data
### Aliases: khazardcond

### ** Examples

library(survival)
fit<-khazardcond(times = lung$time,delta = lung$status-1,covariate = lung$age,h=c(200,20))



