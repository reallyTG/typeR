library(BMS)


### Name: coef.bma
### Title: Posterior Inclusion Probabilities and Coefficients from a 'bma'
###   Object
### Aliases: estimates.bma coef.bma
### Keywords: models

### ** Examples

#sample, with keeping the best 200 models:
data(datafls)
mm=bms(datafls,burn=1000,iter=5000,nmodel=200)

#standard BMA PIPs and coefficients from the MCMC sampling chain, based on 
#  ...how frequently the models were drawn
coef(mm)

#standardized coefficients, ordered by index
coef(mm,std.coefs=TRUE,order.by.pip=FALSE)

#coefficients conditional on inclusion:
coef(mm,condi.coef=TRUE)

#same as
ests=coef(mm,condi.coef=FALSE)
ests[,2]/ests[,1]

#PIPs, coefficients, and signs based on the best 200 models
estimates.bma(mm,exact=TRUE)

#... and based on the 50 best models
coef(mm[1:50],exact=TRUE)






