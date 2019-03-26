library(thregI)


### Name: predict.thregIcure
### Title: predict the initial health status value, the drift value of the
###   health process and cure rate
### Aliases: predict.thregIcure
### Keywords: cure rate interval-censored data prediction survival analysis
###   threshold regression

### ** Examples

#load the data "hdsd"
data("hdsd", package="thregI")

# transform categorical variable Noadyn into factor variable f.noadyn
hdsd$f.noadyn=factor(hdsd$Noadyn)

# fit the threshold regression cure-rate model
# the covariates are TR360, Noadyn, Sex and Age
fit<-thregIcure(Surv(left, right, type='interval2')~f.noadyn|TR360|Sex+Age, data=hdsd)

# calculate the predicted values
# subject is ambulatory (Noadyn1=1), TR360 = 1.5, male and 30 years old
# note that f.noadyn1 is the name of non-reference group
predict.thregIcure(fit, timevalue = 1, scenario=f.noadyn1(1)+TR360(1.5)+Sex(1)+Age(30))



