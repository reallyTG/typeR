library(reinforcedPred)


### Name: modelFit_VS
### Title: Model fit for the training set, variable selection version
### Aliases: modelFit_VS

### ** Examples

## No test: 
library(reinforcedPred)

# take the example training data (high dimensional Z) from the reinforcedPred package
# see documentation for details about the data set train_data_mulZ
Y <- as.numeric(train_data_mulZ$Y)
tildeX.missing <- as.matrix(train_data_mulZ[,2:62])
Z <- as.matrix(train_data_mulZ[,63:dim(train_data_mulZ)[2]])

# analysis starts
startT <- 25
weight <- rep(1, length(Y))

result <- modelFit_VS(Y, tildeX.missing, Z, startT, pve = 0.99, nbasis = 10, weight)

# obtained elastic net logistic regression fit and FPCA decompositions
list_cvfit <- result$list_cvfit
list_fpcaFit <- result$list_fpcaFit
## End(No test)



