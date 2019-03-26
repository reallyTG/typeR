library(MXM)


### Name: Conditional independence tests for sucess rates
### Title: Binomial regression conditional independence test for success
###   rates (binomial)
### Aliases: testIndBinom permBinom waldBinom
### Keywords: Binomial logistic regression Conditional independence test

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(400 * 50, 1, 50), ncol = 50 ) 
#the target feature is the last column of the dataset as a vector
y <- rbinom(400, 10, 0.6)
N <- sample(11:20, 400, replace = TRUE)
target <- cbind(y, N)
results <- testIndBinom(target, dataset, xIndex = 24, csIndex = 10)
results

#run the SES algorithm using the testIndPois conditional independence test
a1 <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndBinom");
a2 <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test = "testIndBinom");



