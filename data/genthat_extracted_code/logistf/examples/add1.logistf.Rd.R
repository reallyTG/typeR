library(logistf)


### Name: add1.logistf
### Title: Add or Drop All Possible Single Terms to/from a 'logistf' Model
### Aliases: add1.logistf drop1.logistf
### Keywords: models regression

### ** Examples

data(sex2)
fit<-logistf(data=sex2, case~1, pl=FALSE)
add1(fit)

fit2<-logistf(data=sex2, case~age+oc+dia+vic+vicl+vis)
drop1(fit2)



