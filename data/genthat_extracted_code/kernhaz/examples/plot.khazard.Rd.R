library(kernhaz)


### Name: plot.khazard
### Title: Plot of kernel hazard estimate from an object of class khazard
### Aliases: plot.khazard

### ** Examples

library(survival)
fit<-khazard(times = lung$time,delta = lung$status-1)
plot(fit)

fit<-khazard(times = lung$time,delta = lung$status-1,h=c(100,150,200,250), value="both")
plot(fit,h=200)



