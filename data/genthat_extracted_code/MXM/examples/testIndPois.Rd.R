library(MXM)


### Name: Conditional independence tests for count data 
### Title: Regression conditional independence test for discrete (counts)
###   class dependent variables
### Aliases: testIndPois testIndNB testIndQPois testIndZIP permPois permNB
###   permZIP waldPois waldNB waldZIP
### Keywords: Poisson regression Negative binomial regression Zero inflated
###   poisson regression Conditional independence test

### ** Examples


#simulate a dataset with continuous data
dataset <- matrix(runif(400 * 50, 1, 50), ncol = 50 ) 
#the target feature is the last column of the dataset as a vector
target <- rpois(400, 10)
results <- testIndPois(target, dataset, xIndex = 24, csIndex = 10)
results

#run the SES algorithm using the testIndPois conditional independence test
sesObject <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndPois");
sesObject2 <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndNB");
summary(sesObject);



