library(kernDeepStackNet)


### Name: fitKDSN
### Title: Fit kernel deep stacking network with random Fourier
###   transformations
### Aliases: fitKDSN
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

# Generate Bernoulli response
rowSumsX <- rowSums(X)
logistVal <- exp(rowSumsX) / (1 + exp(rowSumsX))
set.seed(-1)
y <- sapply(1:100, function(x) rbinom(n=1, size=1, prob=logistVal[x]))

# Fit kernel deep stacking network with three levels
fitKDSN1 <- fitKDSN(y=y, X=X, levels=3, Dim=c(20, 10, 5), 
             sigma=c(6, 8, 10), lambdaRel=c(1, 0.1, 0.01), 
             alpha=rep(0, 3), info=TRUE, 
             seedW=c(1882335773, -1640543072, -931660653))

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
auc(response=ytest, predictor=c(preds))

####################################
# Example with continuous outcome

# Generate covariate matrix
sampleSize <- 100
X <- matrix(0, nrow=100, ncol=5)
for(j in 1:5) {
  set.seed (j)
  X [, j] <- rnorm(sampleSize)
}

# Generate Gaussian random variable conditional on the covariates
linPred <- 1*X[,1] + 2*X[,2] + 0.5*X[,3] + 0.5
set.seed(-1)
y <- sapply(1:100, function(x) rnorm(n=1, mean=linPred[x], sd=2))

# Fit kernel deep stacking network with five levels
fitKDSN1 <- fitKDSN(y=y, X=X, levels=5, Dim=c(40, 20, 10, 7, 5), 
             sigma=c(0.125, 0.25, 0.5, 1, 2), lambdaRel=c(1, 0.5, 0.1, 0.01, 0.001), 
             alpha=rep(0, 5), info=TRUE, 
             seedW=c(-584973296, -251589341, -35931358, 313178052, -1322344272))

# Generate new data
sampleSize <- 100
Xtest <- matrix(0, nrow=100, ncol=5)
for(j in 1:5) {
  set.seed (j+10)
  Xtest [, j] <- rnorm(sampleSize)
}
linPred <- 1*Xtest[,1] + 2*Xtest[,2] + 0.5*Xtest[,3] + 0.5
set.seed(-10)
ytest <- sapply(1:100, function(x) rnorm(n=1, mean=linPred[x], sd=2))

# Predictions on new data and compute root mean squared error
preds <- predict(obj=fitKDSN1, newx=Xtest)
RMSE <- sqrt(mean((ytest-c(preds))^2))
RMSE



