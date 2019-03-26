library(mogavs)


### Name: getBestModel
### Title: Get the best model with nvar variables, or by AIC, BIC or
###   knee-point.
### Aliases: getBestModel
### Keywords: models regression

### ** Examples

data(sampleData)
mod<-mogavs(y~.,data=sampleData,maxGenerations=20)
getBestModel(mod,15,"mse")
getBestModel(mod,method="BIC")



