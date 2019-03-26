library(NPBayesImputeCat)


### Name: NPBayesImputeCat-package
### Title: Bayesian Multiple Imputation for Large-Scale Categorical Data
###   with Structural Zeros
### Aliases: NPBayesImputeCat-package NPBayesImputeCat
### Keywords: package

### ** Examples

require(NPBayesImputeCat)
#Please use NYexample data set for a more realistic example
data('NYMockexample')

#create the model
model <- CreateModel(X,MCZ,10,10000,0.25,0.25)

#run 1 burnins, 2 mcmc iterations and thin every 2 iterations
model$Run(1,2,2)

#retrieve parameters from the final iteration
result <- model$snapshot

#convert ImputedX matrix to dataframe, using proper factors/names etc.
ImputedX <- GetDataFrame(result$ImputedX,X)
#View(ImputedX)

#Most exhauststic examples can be found in the demo below
#demo(example_short)
#demo(example)




