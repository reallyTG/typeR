library(OptimClassifier)


### Name: Optim.LM
### Title: Find out what is the transformation of the response variable
###   that best fits a classification linear model to your data
### Aliases: Optim.LM

### ** Examples

if(interactive()){
## Load a Dataset
data(AustralianCredit)

## Create the model
linearcreditscoring <- Optim.LM(Y~., AustralianCredit, p = 0.7, seed=2018)

#See a ranking of the models tested
print(linearcreditscoring)

#Access to summary of the best model
summary(linearcreditscoring)

#not sure of like the best model, you can access to the all model, for example the 2nd model
summary(linearcreditscoring,2)
}




