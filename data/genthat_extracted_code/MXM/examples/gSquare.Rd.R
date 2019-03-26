library(MXM)


### Name: G-square conditional independence test for discrete data
### Title: G-square conditional independence test for discrete data
### Aliases: gSquare permgSquare
### Keywords: G^2 test Log likelihood ratio Conditional independence test

### ** Examples

#simulate a dataset with binary data
dataset <- matrix(rbinom(500 * 51, 1, 0.6), ncol = 51)
#initialize binary target
target <- dataset[, 51]
#remove target from the dataset
dataset <- dataset[, -51]

#run the gSquare conditional independence test for the binary class variable
results <- gSquare(target, dataset, xIndex = 44, csIndex = c(10,20) )
results

#run SES algorithm using the gSquare conditional independence test for the binary class variable
sesObject <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "gSquare");
target <- as.factor(target)
sesObject2 <- SES(target, dataset, max_k = 3, threshold = 0.05, test = "testIndLogistic");
#print summary of the SES output
summary(sesObject);
summary(sesObject2);



