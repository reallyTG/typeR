library(kernhaz)


### Name: khazard
### Title: Kernel estimate of hazard function for right-censored data
### Aliases: khazard

### ** Examples

library(survival)
fit<-khazard(times = lung$time,delta = lung$status-1)



