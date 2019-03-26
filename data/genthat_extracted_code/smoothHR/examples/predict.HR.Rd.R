library(smoothHR)


### Name: predict.HR
### Title: predict method for an object of class 'HR'.
### Aliases: predict.HR
### Keywords: methods survival

### ** Examples

# Example 1
library(survival)
data(whas500)
fit <- coxph(Surv(lenfol, fstat)~age+hr+gender+diasbp+pspline(bmi)+pspline(los),
data=whas500, x=TRUE)
hr1 <- smoothHR(data=whas500, coxfit=fit)
predict(hr1, predictor="bmi", prob=0, conf.level=0.95)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
pdval <- c(1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 18, 22, 25)
predict(hr2, predictor="los", pred.value=7, conf.level=0.95, prediction.values=pdval,
ref.label="Ref.")



