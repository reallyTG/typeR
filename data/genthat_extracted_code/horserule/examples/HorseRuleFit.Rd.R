library(horserule)


### Name: HorseRuleFit
### Title: Horseshoe RuleFit
### Aliases: HorseRuleFit

### ** Examples

library(MASS)
library(horserule)
data(Boston)
# Split in train and test data
N = nrow(Boston)
train = sample(1:N, 400)
Xtrain = Boston[train,-14]
ytrain = Boston[train, 14]
Xtest = Boston[-train, -14]
ytest = Boston[-train, 14]

# Run the HorseRuleFit with 100 trees
# Increase Number of trees and the number of posterior samples for better modelfit
hrres = HorseRuleFit(X = Xtrain, y=ytrain,
                    thin=1, niter=100, burnin=10,
                    L=5, S=6, ensemble = "both", mix=0.3, ntree=100,
                    intercept=FALSE, linterms=1:13, ytransform = "log",
                    alpha=1, beta=2, linp = 1, restricted = 0)

# Calculate the error
pred = predict(hrres, Xtest, burnin=100, postmean=TRUE)
sqrt(mean((pred-ytest)^2))

# Look at the most important rules/linear effects.
importance_hs(hrres)

# Look at the input variable importance.
Variable_importance(hrres, var_names=colnames(Xtrain))



