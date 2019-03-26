library(palaeoSig)


### Name: plot.fittedAgelme
### Title: Plots fitted agelme model and dates
### Aliases: plot.fittedAgelme

### ** Examples

data(STOR)
fit.mod <- with(STOR,agelme(depthup,depthdo,cageup,cagedo))
#Predicting using the constant variance model,
#for each cm between 70 and 400 cm.
fit.pre <- predict(fit.mod,1,70:400)
plot(fit.pre)



