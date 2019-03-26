library(MXM)


### Name: Conditional independence tests for positive data
### Title: Regression conditional independence test for positive response
###   variables.
### Aliases: testIndGamma testIndNormLog testIndIGreg permGamma permNormLog
###   permIGreg waldGamma waldNormLog waldIGreg
### Keywords: Gamma regression Log link

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(rnorm(400 * 50, 1, 5), ncol = 50 ) 
#the target feature is the last column of the dataset as a vector
target <- rgamma(400, 1, 3)
testIndGamma(target, dataset, xIndex = 24, csIndex = 10)
testIndNormLog(target, dataset, xIndex = 24, csIndex = 10)
#run the SES algorithm using the testIndPois conditional independence test
sesObject <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndGamma");
sesObject2 <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndNormLog");



