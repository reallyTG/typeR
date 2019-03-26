library(caret)


### Name: pcaNNet
### Title: Neural Networks with a Principal Component Step
### Aliases: pcaNNet pcaNNet.default predict.pcaNNet pcaNNet.formula
###   print.pcaNNet
### Keywords: neural

### ** Examples


data(BloodBrain)
modelFit <- pcaNNet(bbbDescr[, 1:10], logBBB, size = 5, linout = TRUE, trace = FALSE)
modelFit

predict(modelFit, bbbDescr[, 1:10])




