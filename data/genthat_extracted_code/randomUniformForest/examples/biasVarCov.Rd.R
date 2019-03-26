library(randomUniformForest)


### Name: biasVarCov
### Title: Bias-Variance-Covariance Decomposition
### Aliases: biasVarCov

### ** Examples

n = 100;  p = 10
# simulate 'p' gaussian vectors with random parameters between -10 and 10.
X <- simulationData(n,p)

# make a rule to create response vector
epsilon1 = runif(n,-1,1)
epsilon2 = runif(n,-1,1)
rule = 2*(X[,1]*X[,2] + X[,3]*X[,4]) + epsilon1*X[,5] + epsilon2*X[,6]

# Classification
Y <- as.factor(ifelse(rule > mean(rule), 1, 0))

# define random train and test sample of (X,Y)
trainTestIdx <- cut(sample(1:nrow(X), nrow(X)), 2, labels= FALSE)

# training sample
Xtrain = X[trainTestIdx == 1,]
Ytrain = Y[trainTestIdx == 1]

# test sample
Xtest = X[trainTestIdx == 2,]
Ytest = Y[trainTestIdx == 2]

# learning model
synthDataset.ruf <- randomUniformForest(Xtrain, Ytrain, threads = 1, 
ntree = 20, BreimanBounds = FALSE)
synthDataset.pred.ruf <- predict(synthDataset.ruf, Xtest)

# test error
testError = 1 - sum(synthDataset.pred.ruf == Ytest)/length(Ytest)
testError

# test error decomposition
testError.dec <- biasVarCov(synthDataset.pred.ruf, Ytest, regression = FALSE)

# Regression
Y = rule

# training sample
Xtrain = X[trainTestIdx == 1,]
Ytrain = Y[trainTestIdx == 1]

# test sample
Xtest = X[trainTestIdx == 2,]
Ytest = Y[trainTestIdx == 2]

# learning model
synthDataset.ruf <- randomUniformForest(Xtrain, Ytrain, threads = 1,
ntree = 20, BreimanBounds = FALSE)
synthDataset.pred.ruf <- predict(synthDataset.ruf, Xtest)

# MSE
MSE <- sum((synthDataset.pred.ruf - Ytest)^2)/length(Ytest)

# test error decomposition
MSE.dec <- biasVarCov(synthDataset.pred.ruf, Ytest, regression = TRUE)



