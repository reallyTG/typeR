library(OptimClassifier)


### Name: Optim.LMM
### Title: Discover what is the best random variable for your data set
### Aliases: Optim.LMM

### ** Examples

if(interactive()){
## Load a Dataset
data(AustralianCredit)
## Generate a model
modelFit <- Optim.LMM("Y", AustralianCredit, p = 0.7, seed=2018)
modelFit
}




