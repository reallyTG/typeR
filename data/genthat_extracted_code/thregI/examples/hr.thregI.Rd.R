library(thregI)


### Name: hr.thregI
### Title: perform hazard ratio for threshold regression model
### Aliases: hr hr.thregI
### Keywords: hazard ratio interval-censored data survival analysis
###   threshold regression

### ** Examples

#load the data "bcos"
data("bcos", package="thregI")

#transform the "treatment" variable into factor variable f.treatment
bcos$f.treatment=factor(bcos$treatment)

#fit the threshold regression model on the factor variable f.treatment
fit<-thregI(Surv(left, right, type='interval2')~f.treatment|f.treatment,data=bcos)

#hazard ratio of the radiation group vs. the radiation with chemotherapy at fifth month
hr.thregI(fit, var = f.treatment, timevalue = 5)



