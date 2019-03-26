library(caret)


### Name: knnreg
### Title: k-Nearest Neighbour Regression
### Aliases: knnreg knnregTrain knnreg.formula knnreg.default knnreg.matrix
###   knnreg.data.frame print.knnreg
### Keywords: multivariate

### ** Examples


data(BloodBrain)

inTrain <- createDataPartition(logBBB, p = .8)[[1]]

trainX <- bbbDescr[inTrain,]
trainY <- logBBB[inTrain]

testX <- bbbDescr[-inTrain,]
testY <- logBBB[-inTrain]

fit <- knnreg(trainX, trainY, k = 3)

plot(testY, predict(fit, testX))




