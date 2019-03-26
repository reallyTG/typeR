library(MXM)


### Name: Conditional independence test for proportions/percentages
### Title: Beta regression conditional independence test for
###   proportions/percentage class dependent variables and mixed predictors
### Aliases: testIndBeta permBeta waldBeta
### Keywords: Beta regression Conditional independence test

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(100 * 20, 1, 1000), ncol = 20 ) 
#the target feature is the last column of the dataset as a vector
target <- dataset[, 20]
dataset <- dataset[, -20]
target <- target / (max(target) + 2 )

results <- testIndBeta(target, dataset, xIndex = 14, csIndex = 9)
results

#run the SES algorithm using the testIndBeta conditional independence test
sesObject <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndBeta");
#print summary of the SES output
summary(sesObject);



