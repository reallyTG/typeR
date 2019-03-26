library(kernhaz)


### Name: plot.khazardcond
### Title: Plot of kernel conditional hazard estimate from an object of
###   class khazardcond
### Aliases: plot.khazardcond

### ** Examples

library(survival)
fit<-khazardcond(times = lung$time,delta = lung$status-1,covariate = lung$age,h=c(200,20))
plot(fit)



