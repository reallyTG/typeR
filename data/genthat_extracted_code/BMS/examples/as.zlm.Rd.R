library(BMS)


### Name: as.zlm
### Title: Extract a Model from a bma Object
### Aliases: as.zlm
### Keywords: models

### ** Examples

data(datafls)

mm=bms(datafls[,1:6],mcmc="enumeration") # do a small BMA chain
topmodels.bma(mm)[,1:5] #display the best 5 models

m2a=as.zlm(mm,4) #extract the fourth best model
summary(m2a)

# Bayesian Model Selection:
# transform the best model into an OLS model:
lm(model.frame(as.zlm(mm)))

# extract the model only containing the 5th regressor
m2b=as.zlm(mm,c(0,0,0,0,1)) 

# extract the model only containing the 5th regressor in hexcode
print(bin2hex(c(0,0,0,0,1)))
m2c=as.zlm(mm,"01")







