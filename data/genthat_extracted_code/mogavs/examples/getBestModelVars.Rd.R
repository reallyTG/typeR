library(mogavs)


### Name: getBestModelVars
### Title: Get variable names of the best model with nvar variables, or
###   defined by lowest MSE, AIC, BIC or knee-point.
### Aliases: getBestModelVars
### Keywords: models regression

### ** Examples

data(sampleData)
mod<-mogavs(y~.,data=sampleData,maxGenerations=20)
getBestModelVars(mod,nvars=15,sampleData,NULL)
getBestModelVars(mod,nvars=0,data=sampleData,method="BIC")



