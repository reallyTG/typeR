library(logistf)


### Name: summary.logistf
### Title: 'summary' Method for 'logistf' Objects
### Aliases: summary.logistf
### Keywords: models regression

### ** Examples

data(sex2)
fit<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sex2)
summary(fit)



