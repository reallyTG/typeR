library(thregI)


### Name: thregI
### Title: fit threshold regression for interval-censored data
### Aliases: thregI
### Keywords: interval-censored data survival analysis threshold regression

### ** Examples

#load the data "bcos"
data("bcos", package="thregI")

#transform the "treatment" variable into factor variable f.treatment
bcos$f.treatment=factor(bcos$treatment)

#fit the threshold regression model on the factor variable f.treatment
fit<-thregI(Surv(left, right, type='interval2')~f.treatment|f.treatment, data=bcos)
fit



