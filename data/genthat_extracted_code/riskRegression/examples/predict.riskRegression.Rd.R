library(riskRegression)


### Name: predict.riskRegression
### Title: Predict individual risk.
### Aliases: predict.riskRegression
### Keywords: survival

### ** Examples


data(Melanoma)
library(prodlim)
library(survival)

fit.tarr <- ARR(Hist(time,status)~age+invasion+strata(sex),data=Melanoma,cause=1)
predict(fit.tarr,newdata=data.frame(age=48,
                     invasion=factor("level.1",
                         levels=levels(Melanoma$invasion)),
                     sex=factor("Female",levels=levels(Melanoma$sex))))
predict(fit.tarr,newdata=data.frame(age=48,
                     invasion=factor("level.1",
                         levels=levels(Melanoma$invasion)),
                     sex=factor("Male",levels=levels(Melanoma$sex))))
predict(fit.tarr,newdata=data.frame(age=c(48,58,68),
                     invasion=factor("level.1",
                         levels=levels(Melanoma$invasion)),
                     sex=factor("Male",levels=levels(Melanoma$sex))))
predict(fit.tarr,newdata=Melanoma[1:4,])




