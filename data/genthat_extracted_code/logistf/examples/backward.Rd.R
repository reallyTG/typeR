library(logistf)


### Name: backward
### Title: Backward Elimination of Model Terms in 'logistf' Models
### Aliases: backward forward
### Keywords: models regression

### ** Examples

data(sex2)
fit<-logistf(data=sex2, case~1, pl=FALSE)
fitf<-forward(fit)

fit2<-logistf(data=sex2, case~age+oc+vic+vicl+vis+dia)
fitb<-backward(fit2)



