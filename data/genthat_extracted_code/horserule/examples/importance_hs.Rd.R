library(horserule)


### Name: importance_hs
### Title: Most important Rules/terms
### Aliases: importance_hs

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
hrres = HorseRuleFit(X = Xtrain, y=ytrain,
                    thin=1, niter=100, burnin=10,
                    L=5, S=6, ensemble = "both", mix=0.3, ntree=100,
                    intercept=FALSE, linterms=1:13, ytransform = "log",
                    alpha=1, beta=2, linp = 1, restricted = 0)

#Create an importance table containing the 10 most important rules and linear terms
importance_hs(hrres, k=10)



