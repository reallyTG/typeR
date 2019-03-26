library(OptimClassifier)


### Name: Optim.NN
### Title: Discover the best Neural Network for your data
### Aliases: Optim.NN

### ** Examples

if(interactive()){
## Load a Dataset
data(AustralianCredit)
## Generate a model
modelFit <- Optim.NN(Y~., AustralianCredit, p = 0.7, seed=2018)
modelFit
}




