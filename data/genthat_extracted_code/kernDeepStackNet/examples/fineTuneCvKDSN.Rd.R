library(kernDeepStackNet)


### Name: fineTuneCvKDSN
### Title: Fine tuning of random weights of a given KDSN model
### Aliases: fineTuneCvKDSN
### Keywords: models & regression

### ** Examples

####################################
# Example with binary outcome

# Generate covariate matrix
sampleSize <- 100
X <- matrix(0, nrow=100, ncol=5)
for(j in 1:5) {
  set.seed (j)
  X [, j] <- rnorm(sampleSize)
}

# Generate bernoulli response
rowSumsX <- rowSums(X)
logistVal <- exp(rowSumsX) / (1 + exp(rowSumsX))
set.seed(-1)
y <- sapply(1:100, function(x) rbinom(n=1, size=1, prob=logistVal[x]))

# Generate test indices
library(caret)
set.seed(123)
cvFoldIndices <- createFolds(y=y, k=2, returnTrain=TRUE)

# Fit kernel deep stacking network with three levels
# Initial seed should be supplied in fitted model!
fitKDSN1 <- fitKDSN(y=y, X=X, levels=3, Dim=c(20, 10, 5), 
             sigma=c(0.5, 1, 2), lambdaRel=c(1, 0.1, 0.01), 
             alpha=rep(0, 3), info=TRUE, seedW=c(0, 1:2))

# Apply additional fine tuning based on predictive deviance
fitKDSN2 <- fineTuneCvKDSN(estKDSN=fitKDSN1, y=y, X=X, 
fineTuneIt=25, info=TRUE, cvIndex=cvFoldIndices)

# Generate new test data
sampleSize <- 100
Xtest <- matrix(0, nrow=100, ncol=5)
for(j in 1:5) {
  set.seed (j+50)
  Xtest [, j] <- rnorm(sampleSize)
}
rowSumsXtest <- rowSums(Xtest)
logistVal <- exp(rowSumsXtest) / (1 + exp(rowSumsXtest))
set.seed(-1)
ytest <- sapply(1:100, function(x) rbinom(n=1, size=1, prob=logistVal[x]))

# Evaluate on test data with auc
library(pROC)
preds <- predict(fitKDSN1, Xtest)
auc1 <- auc(response=ytest, predictor=c(preds))
preds <- predict(fitKDSN2, Xtest)
auc2 <- auc(response=ytest, predictor=c(preds))
auc1 < auc2 # TRUE
# The fine tuning improved the test auc



