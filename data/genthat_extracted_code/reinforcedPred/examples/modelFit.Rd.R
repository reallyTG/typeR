library(reinforcedPred)


### Name: modelFit
### Title: Model fit for the training set
### Aliases: modelFit

### ** Examples

library(reinforcedPred)

# take the example training data (univariate Z) from the reinforcedPred package
# see documentation for details about the data set train_data_uniZ
Y <- as.numeric(train_data_uniZ$Y)
tildeX.missing <- as.matrix(train_data_uniZ[,2:62])
Z <- as.numeric(train_data_uniZ$Z)

# analysis starts
startT <- 55
link <- "probit"
weight <- rep(1, length(Y))

result <- modelFit(Y, tildeX.missing, Z, startT, link, pve = 0.99, nbasis = 10, weight)

# obtained parameter estimates and FPCA decompositions
list_paraEst <- result$list_paraEst
list_fpcaFit <- result$list_fpcaFit




