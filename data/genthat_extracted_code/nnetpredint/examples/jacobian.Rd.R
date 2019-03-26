library(nnetpredint)


### Name: jacobian
### Title: Jacobian Matrix of Gradient Function for Training Datasets
### Aliases: jacobian jacobian.default jacobian.nnet jacobian.nn
###   jacobian.rsnns

### ** Examples

library(nnet)
xTrain <- rbind(cbind(runif(150,min = 0, max = 0.5),runif(150,min = 0, max = 0.5)) ,
		cbind(runif(150,min = 0.5, max = 1),runif(150,min = 0.5, max = 1))
		)
nObs <- dim(xTrain)[1]
yTrain <- 0.5 + 0.4 * sin(2* pi * xTrain %*% c(0.4,0.6)) +rnorm(nObs,mean = 0, sd = 0.05)
# Training nnet models
net <- nnet(yTrain ~ xTrain,size = 3, rang = 0.1,decay = 5e-4, maxit = 500)

# Calculating Jacobian Matrix of the training samples
library(nnetpredint)
jacobMat = jacobian(net,xTrain)
dim(jacobMat)



