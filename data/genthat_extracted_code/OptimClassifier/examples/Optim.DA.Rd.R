library(OptimClassifier)


### Name: Optim.DA
### Title: Discover the best Discriminant Analysis for your data
### Aliases: Optim.DA

### ** Examples

if(interactive()){
## Load a Dataset
data(AustralianCredit)
## Generate a Model
modelFit <- Optim.DA(Y~., AustralianCredit, p = 0.7, seed=2018)
modelFit
}




