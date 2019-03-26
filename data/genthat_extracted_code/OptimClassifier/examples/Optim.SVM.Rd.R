library(OptimClassifier)


### Name: Optim.SVM
### Title: Discover the best SVM for your data
### Aliases: Optim.SVM

### ** Examples

if(interactive()){

## Load a Dataset
data(AustralianCredit)

## Generate a model
modelFit <- Optim.SVM(Y~., AustralianCredit, p = 0.7, seed=2018)
modelFit

}




