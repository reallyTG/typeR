library(nnetpredint)


### Name: nnetPredInt
### Title: Prediction Intervals of Neural Networks
### Aliases: nnetPredInt nnetPredInt.default nnetPredInt.nnet
###   nnetPredInt.nn nnetPredInt.rsnns

### ** Examples

# Example 1: Using the nn object trained by neuralnet package
set.seed(500)
library(MASS)
data <- Boston
maxs <- apply(data, 2, max)
mins <- apply(data, 2, min)
scaled <- as.data.frame(scale(data, center = mins, scale = maxs - mins)) # normalization
index <- sample(1:nrow(data),round(0.75*nrow(data)))
train_ <- scaled[index,]
test_ <- scaled[-index,]

library(neuralnet) # Training
n <- names(train_)
f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
nn <- neuralnet(f,data = train_,hidden = c(5,3),linear.output = FALSE)
plot(nn)

library(nnetpredint) # Getting prediction confidence interval
x <- train_[,-14]
y <- train_[,14]
newData <- test_[,-14]

# S3 generic method: Object of nn
yPredInt <- nnetPredInt(nn, x, y, newData)
print(yPredInt[1:20,])

# S3 default method for user defined weights input, without model object trained:
yFit <- c(nn$net.result[[1]])
nodeNum <- c(13,5,3,1)
m <- 3
wtsList <- nn$weights[[1]]
wts <- transWeightListToVect(wtsList,m)
yPredInt2 <- nnetPredInt(object = NULL, x, y, yFit, nodeNum, wts, newData, alpha = 0.05)
print(yPredInt2[1:20,])

# Compare to the predict values from the neuralnet Compute method
predValue <- compute(nn,newData)
print(matrix(predValue$net.result[1:20]))



# Example 2: Using the nnet object trained by nnet package
library(nnet)
xTrain <- rbind(cbind(runif(150,min = 0, max = 0.5),runif(150,min = 0, max = 0.5)) ,
		cbind(runif(150,min = 0.5, max = 1),runif(150,min = 0.5, max = 1))
		)
nObs <- dim(xTrain)[1]
yTrain <- 0.5 + 0.4 * sin(2* pi * xTrain %*% c(0.4,0.6)) +rnorm(nObs,mean = 0, sd = 0.05)
plot(xTrain %*% c(0.4,0.6),yTrain)

# Training nnet models
net <- nnet(yTrain ~ xTrain,size = 3, rang = 0.1,decay = 5e-4, maxit = 500)
yFit <- c(net$fitted.values)
nodeNum <- c(2,3,1)
wts <- net$wts

# New data for prediction intervals
library(nnetpredint)
newData <- cbind(seq(0,1,0.05),seq(0,1,0.05))
yTest <- 0.5 + 0.4 * sin(2* pi * newData %*% c(0.4,0.6))+rnorm(dim(newData)[1],
    mean = 0, sd = 0.05)

# S3 generic method: Object of nnet
yPredInt <- nnetPredInt(net, xTrain, yTrain, newData)
print(yPredInt[1:20,])

# S3 default method: xTrain,yTrain,yFit,...
yPredInt2 <- nnetPredInt(object = NULL, xTrain, yTrain, yFit, node = nodeNum, wts = wts,
    newData, alpha = 0.05, funName = 'sigmoid')

plot(newData %*% c(0.4,0.6),yTest,type = 'b')
lines(newData %*% c(0.4,0.6),yPredInt$yPredValue,type = 'b',col='blue')
lines(newData %*% c(0.4,0.6),yPredInt$lowerBound,type = 'b',col='red')   # lower bound
lines(newData %*% c(0.4,0.6),yPredInt$upperBound,type = 'b',col='red')   # upper bound



# Example 3: Using the rsnns object trained by RSNNS package
library(RSNNS)
data(iris)
#shuffle the vector
iris <- iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]
irisValues <- iris[,1:4]
irisTargets <- decodeClassLabels(iris[,5])[,'setosa']

iris <- splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)
iris <- normTrainingAndTestSet(iris)
model <- mlp(iris$inputsTrain, iris$targetsTrain, size=5, learnFuncParams=c(0.1),
	maxit=50, inputsTest=iris$inputsTest, targetsTest=iris$targetsTest)
predictions <- predict(model,iris$inputsTest)

# Generating prediction intervals
library(nnetpredint)
# S3 Method for rsnns class prediction intervals
xTrain <- iris$inputsTrain
yTrain <- iris$targetsTrain
newData <- iris$inputsTest
yPredInt <- nnetPredInt(model, xTrain, yTrain, newData)
print(yPredInt[1:20,])



