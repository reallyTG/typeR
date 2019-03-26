library(OptimClassifier)


### Name: Optim.GLM
### Title: Find out what is the error distribution and link function that
###   best fits a classification generalized linear model to your data
### Aliases: Optim.GLM

### ** Examples

if(interactive()){
## Load a Dataset
data(AustralianCredit)

## Create the model
creditscoring <- Optim.GLM(Y~., AustralianCredit, p = 0.7, seed=2018)

#See a ranking of the models tested
print(creditscoring)

#Access to summary of the best model
summary(creditscoring)

#not sure of like the best model, you can access to the all model, for example the 2nd model
summary(creditscoring,2)
}





