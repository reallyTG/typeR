library(BMS)


### Name: pmpmodel
### Title: Posterior Model Probability for any Model
### Aliases: pmpmodel
### Keywords: utilities

### ** Examples


## sample BMA for growth dataset, enumeration sampler
data(datafls)
mm=bms(datafls[,1:10],nmodel=5)

#show the best 5 models:
pmp.bma(mm)
#first column: posterior model prob based on model likelihoods,
#second column: posterior model prob based MCMC frequencies,

### Different ways to get the same result: #########

#PMP of 2nd-best model (hex-code representation)
pmpmodel(mm,"00c")

#PMP of 2nd-best model (binary representation)
incls=as.logical(beta.draws.bma(mm)[,2])
pmpmodel(mm,incls)

#PMP of 2nd-best model (via variable names)
#names of regressors in model "00c": 
names(datafls[,2:10])[incls]
pmpmodel(mm,c("SubSahara", "LatAmerica"))

#PMP of 2nd-best model (via positions)
pmpmodel(mm,c(6,7))

####PMP of another model #########
pmpmodel(mm,1:5)





