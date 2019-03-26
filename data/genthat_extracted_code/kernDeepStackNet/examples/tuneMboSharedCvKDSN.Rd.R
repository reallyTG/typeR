library(kernDeepStackNet)


### Name: tuneMboSharedCvKDSN
### Title: Tuning of KDSN with efficient global optimization given level by
###   cross-validation and shared hyperparameters
### Aliases: tuneMboSharedCvKDSN
### Keywords: models & regression

### ** Examples

# Generate small sample of 20 observations of a binary classification task
# Due to keeping the example as fast as possible, the parameters of the tuning 
# algorithm are set for low accuracy. Higher values of tol_input, fineTuneIt, 
# maxRuns, repetitions will increase performance considerably.
library(pROC)

# Generate design matrix
sampleSize <- 20
X <- matrix(0, nrow=sampleSize, ncol=5)
for(j in 1:5) {
  set.seed (j)
  X [, j] <- rnorm(sampleSize)
}

# Generate response of binary problem with sum(X) > 0 -> 1 and 0 elsewhere
set.seed(-1)
error <- rnorm (sampleSize)
y <- ifelse((rowSums(X) + error) > 0, 1, 0)

# Generate test data
Xtest <- matrix(, nrow=sampleSize, ncol=5)
for(j in 1:5) {
  set.seed (j*2+1)
  Xtest [, j] <- rnorm(sampleSize)
}

# Generate test response
set.seed(-10)
error <- rnorm (sampleSize)
ytest <- ifelse((rowSums(Xtest) + error) > 0, 1, 0)

# Draw cv training indices
library(caret)
cvTrainInd <- createFolds(y=y, k = 2, list = TRUE, returnTrain = TRUE)

# Define loss function
defLossFunc <- function(preds, ytest) {-c(auc(response=ytest, predictor=c(preds)))}

# Tune kernel deep stacking network by auc on test data
## Not run: 
##D tuned_KDSN_EGO_level <- tuneMboSharedCvKDSN (y=y, X=X, 
##D fineTuneIt=10, nStepMult=2, designMult=3,
##D cvIndex=cvTrainInd, lossFunc=defLossFunc)
##D preds <- predict(tuned_KDSN_EGO_level, newx=Xtest)
##D library(pROC)
##D auc(response=ytest, predictor=c(preds))
## End(Not run)



