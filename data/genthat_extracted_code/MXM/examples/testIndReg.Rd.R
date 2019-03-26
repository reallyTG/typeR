library(MXM)


### Name: Conditional independence tests for continous univariate and multivariate data 
### Title: Linear (and non-linear) regression conditional independence test
###   for continous univariate and multivariate response variables
### Aliases: testIndReg testIndRQ testIndMVreg testIndMMReg permReg
###   permMMReg permRQ permMVreg waldMMReg
### Keywords: Linear regression test Conditional independence test

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(100 * 100, 1, 100), ncol = 100 )
#the target feature is the last column of the dataset as a vector
target <- dataset[, 100]
dataset <- dataset[, -100]

testIndReg(target, dataset, xIndex = 44, csIndex = 50)
testIndMMReg(target, dataset, xIndex = 44, csIndex = 50)
testIndRQ(target, dataset, xIndex = 44, csIndex = 50)
testIndIGreg(target, dataset, xIndex = 44, csIndex = 50)

#define class variable (here tha last column of the dataset)
#run the SES algorithm using the testIndReg conditional independence test
sesObject <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndReg");
sesObject2 <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndRQ");
#print summary of the SES output

summary(sesObject);
summary(sesObject2);



