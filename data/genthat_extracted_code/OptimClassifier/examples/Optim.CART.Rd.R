library(OptimClassifier)


### Name: Optim.CART
### Title: Tune CART for the optimal complexity parameter
### Aliases: Optim.CART

### ** Examples

if(interactive()){
## Load a Dataset
data(AustralianCredit)
## Generate a model
modelFit <- Optim.CART(Y~., AustralianCredit, p = 0.7, seed=2018)
modelFit
}




