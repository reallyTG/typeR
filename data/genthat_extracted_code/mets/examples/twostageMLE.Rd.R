library(mets)


### Name: twostageMLE
### Title: Twostage survival model fitted by pseudo MLE
### Aliases: twostageMLE
### Keywords: survival

### ** Examples

data(diabetes)
dd <- phreg(Surv(time,status==1)~treat+cluster(id),diabetes)
oo <- twostageMLE(dd,data=diabetes)
summary(oo)

theta.des <- model.matrix(~-1+factor(adult),diabetes)

oo <-twostageMLE(dd,data=diabetes,theta.des=theta.des)
summary(oo)



