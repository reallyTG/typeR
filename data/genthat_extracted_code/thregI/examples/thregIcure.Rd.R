library(thregI)


### Name: thregIcure
### Title: fit threshold regression cure-rate model for interval-censored
###   data
### Aliases: thregIcure
### Keywords: cure rate interval-censored data survival analysis threshold
###   regression

### ** Examples

#load the data "hdsd"
data("hdsd", package="thregI")

#transform the Noadyn variable into factor variable f.noadyn
hdsd$f.noadyn=factor(hdsd$Noadyn)

#fit the threshold regression cure-rate model
#the covariates are TR360, Noadyn, Sex and Age
fit<-thregIcure(Surv(left, right, type='interval2')~f.noadyn+TR360|f.noadyn+TR360|f.noadyn+TR360+
     Sex+Age, data=hdsd)
fit
#note that p-value of the goodness of fit test return by thregIcure function



