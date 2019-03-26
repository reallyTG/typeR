library(reinforcedPred)


### Name: reinforced_VS
### Title: Reinforced risk prediction with budget constraint, variable
###   selection version
### Aliases: reinforced_VS

### ** Examples

## No test: 
library(reinforcedPred)
set.seed(1)

# take the example training data (high dimensional Z) from the reinforcedPred package
# see documentation for details about the data set train_data_mulZ
Y <- as.numeric(train_data_mulZ$Y)
tildeX.missing <- as.matrix(train_data_mulZ[,2:62])
Z <- as.matrix(train_data_mulZ[,63:dim(train_data_mulZ)[2]])

# analysis starts
budget <- 45
folds <- 5
startT <- 25

result <- reinforced_VS(Y, tildeX.missing, Z, budget, folds, startT, pve = 0.99, nbasis = 10)

# obtained elastic net logistic regression fit and FPCA decompositions
list_cvfit <- (result$final.result)$list_cvfit
list_fpcaFit <- (result$final.result)$list_fpcaFit

# optimal tau that minimizes the misclassification error under the budget constraint
final.tau <- result$final.tau
final.tau

# use the fitted model to predict the label Y for subjects in the test data
# see documentation for details about the data set test_data_mulZ
testY <- as.numeric(test_data_mulZ$testY)
test.tildeX.missing <- as.matrix(test_data_mulZ[,2:62])
test.Z <- as.matrix(test_data_mulZ[,63:dim(test_data_mulZ)[2]])

pred <- modelPredict_VS(list_fpcaFit, list_cvfit, test.tildeX.missing, test.Z, startT, final.tau)

# predicted outcome Y for each subject in the test data
predY.test <- pred$final.label
# misclassification error
mis.error <- sum(predY.test != testY, na.rm = TRUE) / sum(!is.na(testY))
mis.error

# the average cost when we applied the prediction procedure to the test data
pred$avg.cost
## End(No test)



