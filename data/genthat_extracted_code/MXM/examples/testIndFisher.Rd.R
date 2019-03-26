library(MXM)


### Name: Correlation based conditonal independence tests
### Title: Fisher and Spearman conditional independence test for continuous
###   class variables
### Aliases: testIndFisher testIndSpearman testIndMMFisher permFisher
###   permMMFisher permDcor
### Keywords: Fisher's Test Conditional Independence Test

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 200, 1, 1000), nrow = 1000 )
#the target feature is the last column of the dataset as a vector
target <- dataset[, 200]
res1 <- testIndFisher(target, dataset, xIndex = 44, csIndex = 100)
res2 <- testIndSpearman(target, dataset, xIndex = 44, csIndex = 100)
res3 <- permFisher(target, dataset, xIndex = 44, csIndex = 100, R = 999)
res4 <- permDcor(target, dataset, xIndex = 44, csIndex = 100, R = 99)

#define class variable (here tha last column of the dataset)
dataset <- dataset[, -200];
#run the SES algorithm using the testIndFisher conditional independence test
sesObject <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndFisher");

#print summary of the SES output
summary(sesObject);



