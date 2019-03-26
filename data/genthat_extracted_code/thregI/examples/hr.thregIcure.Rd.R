library(thregI)


### Name: hr.thregIcure
### Title: perform hazard ratio for threshold regression cure-rate model
### Aliases: hr.thregIcure
### Keywords: cure rate hazard ratio interval-censored data survival
###   analysis threshold regression

### ** Examples

#load the data "hdsd"
data("hdsd", package="thregI")

#transform categorical variable Noadyn into factor variable f.noadyn
hdsd$f.noadyn=factor(hdsd$Noadyn)

#fit the threshold regression cure-rate model
#the covariates are TR360, Noadyn, Sex and Age
fit<-thregIcure(Surv(left, right, type='interval2')~f.noadyn|TR360|Sex+Age, data=hdsd)

#calculate the hazard ratios for categorical variable Noadyn
#specified scenario of TR360=1.5, Male, Age=30 at time one
hr.thregIcure(fit, var = f.noadyn, timevalue = 1, scenario=TR360(1.5)+Sex(1)+Age(30))



