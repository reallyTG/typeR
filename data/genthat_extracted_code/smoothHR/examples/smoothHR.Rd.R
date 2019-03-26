library(smoothHR)


### Name: smoothHR
### Title: Smooth Hazard Ratio Curves Taking a Reference Value
### Aliases: smoothHR
### Keywords: models regression survival

### ** Examples

# Example 1
library(survival)
data(whas500)
fit <- coxph(Surv(lenfol, fstat)~age+hr+gender+diasbp+pspline(bmi)+pspline(los), data=whas500,
x=TRUE)
hr1 <- smoothHR(data=whas500, coxfit=fit)
print(hr1)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
print(hr2)



