library(smoothHR)


### Name: plot.HR
### Title: Flexible hazard ratio curves taking a specific covariate value
###   as reference
### Aliases: plot.HR
### Keywords: hplot methods survival

### ** Examples

# Example 1
library(survival)
data(whas500)
fit <- coxph(Surv(lenfol, fstat)~age+hr+gender+diasbp+pspline(bmi)+pspline(los),
data=whas500, x=TRUE)
hr1 <- smoothHR(data=whas500, coxfit=fit)
plot(hr1, predictor="bmi", prob=0, conf.level=0.95)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
plot(hr2, predictor="los", pred.value=7, conf.level=0.95, xlim=c(0,30), round.x=1,
ref.label="Ref.", xaxt="n")
xx <- c(0, 5, 10, 15, 20, 25, 30)
axis(1, xx)



