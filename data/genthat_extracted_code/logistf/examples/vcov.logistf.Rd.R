library(logistf)


### Name: vcov.logistf
### Title: 'vcov' Method for 'logistf' Objects
### Aliases: vcov.logistf
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(sex2)
fit<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sex2)
vcov(fit)



