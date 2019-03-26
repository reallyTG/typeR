library(reinforcedPred)


### Name: reinforced
### Title: Reinforced risk prediction with budget constraint
### Aliases: reinforced

### ** Examples

## No test: 
library(reinforcedPred)
set.seed(1)

# take the example training data (univariate Z) from the reinforcedPred package
# see documentation for details about the data set train_data_uniZ
Y <- as.numeric(train_data_uniZ$Y)
tildeX.missing <- as.matrix(train_data_uniZ[,2:62])
Z <- as.numeric(train_data_uniZ$Z)

# analysis starts
budget <- 45
folds <- 5
startT <- 25
link <- "probit"

result <- reinforced(Y, tildeX.missing, Z, budget, folds, startT, link, pve = 0.99, nbasis = 10)

# obtained parameter estimates and FPCA decompositions
list_paraEst <- (result$final.result)$list_paraEst
list_fpcaFit <- (result$final.result)$list_fpcaFit

# optimal tau that minimizes the misclassification error under the budget constraint
final.tau <- result$final.tau
final.tau

# use the fitted model to predict the label Y for subjects in the test data
# see documentation for details about the data set test_data_uniZ
testY <- as.numeric(test_data_uniZ$testY)
test.tildeX.missing <- as.matrix(test_data_uniZ[,2:62])
test.Z <- as.numeric(test_data_uniZ$test.Z)

pred <- modelPredict(list_fpcaFit, list_paraEst, test.tildeX.missing, test.Z, startT, final.tau)

# predicted outcome Y for each subject in the test data
predY.test <- pred$final.label
# misclassification error
mis.error <- sum(predY.test != testY, na.rm = TRUE) / sum(!is.na(testY))
mis.error

# the average cost when we applied the prediction procedure to the test data
pred$avg.cost
## End(No test)



