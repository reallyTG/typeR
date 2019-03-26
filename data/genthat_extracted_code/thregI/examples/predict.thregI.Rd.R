library(thregI)


### Name: predict.thregI
### Title: predict the initial health status value and the drift value of
###   the health process
### Aliases: predict.thregI
### Keywords: interval-censored data prediction survival analysis threshold
###   regression

### ** Examples

#load the data "bcos"
data("bcos", package="thregI")

# transform the treatment variable into factor variable f.treatment
bcos$f.treatment=factor(bcos$treatment)

# fit the threshold regression model on the factor variable f.treatment
fit<-thregI(Surv(left, right, type='interval2')~f.treatment|f.treatment,data=bcos)

# calculate the predicted values for y0, mu, f, s and h
# for the specified scenario that the treatment classification is 1 at time fifth month.
predict.thregI(fit, timevalue = 5, scenario=f.treatmentRadiation(1))



