library(logistf)


### Name: profile.logistf
### Title: Compute Profile Penalized Likelihood
### Aliases: profile.logistf plot.profile.logistf
### Keywords: models regression

### ** Examples

data(sex2)
fit<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sex2)
plot(profile(fit,variable="dia"))
plot(profile(fit,variable="dia"), "cdf")
plot(profile(fit,variable="dia"), "density")




