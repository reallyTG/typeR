library(mlr)


### Name: setHyperPars
### Title: Set the hyperparameters of a learner object.
### Aliases: setHyperPars

### ** Examples

cl1 = makeLearner("classif.ksvm", sigma = 1)
cl2 = setHyperPars(cl1, sigma = 10, par.vals = list(C = 2))
print(cl1)
# note the now set and altered hyperparameters:
print(cl2)



