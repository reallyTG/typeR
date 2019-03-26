library(leaps)


### Name: regsubsets
### Title: functions for model selection
### Aliases: regsubsets regsubsets.default print.regsubsets
###   print.summary.regsubsets regsubsets.formula summary.regsubsets
###   coef.regsubsets vcov.regsubsets regsubsets.biglm
### Keywords: regression

### ** Examples

data(swiss)
a<-regsubsets(as.matrix(swiss[,-1]),swiss[,1])
summary(a)
b<-regsubsets(Fertility~.,data=swiss,nbest=2)
summary(b)

coef(a, 1:3)
vcov(a, 3)



