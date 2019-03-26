library(cts)


### Name: car
### Title: Fit Continuous Time AR Models to Irregularly Sampled Time Series
### Aliases: car print.car summary.car plot.car predict.car spectrum
###   spectrum.car tsdiag tsdiag.car AIC.car kalsmo kalsmo.car
### Keywords: ts

### ** Examples

data(V22174)
fit <- car(V22174,scale=0.2,order=7, ctrl=car_control(trace=TRUE))
summary(fit)
spectrum(fit)
tsdiag(fit)
AIC(fit)
factab(fit)
###fitted values vs observed values
ntim <- dim(V22174)[1]
plot(V22174[,1], V22174[,2], type="l")
points(V22174[,1], fit$pre2[1:ntim], col="red")
### alternatively
fit2 <- car(V22174,scale=0.2,order=7, ctrl=car_control(fty=3))
plot(V22174[,1], V22174[,2], type="l")
points(V22174[,1], fit2$pre2, col="red")

data(asth)
fit <- car(asth,scale=0.25,order=4, ctrl=car_control(n.ahead=10))
kalsmo(fit)



