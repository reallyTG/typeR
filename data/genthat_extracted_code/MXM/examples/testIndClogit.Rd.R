library(MXM)


### Name: Conditional independence test for case control data
### Title: Conditional independence test based on conditional logistic
###   regression for case control studies
### Aliases: testIndClogit permClogit
### Keywords: Conditional logistic regression Case-control studies
###   Conditional independence test

### ** Examples

#simulate a dataset with continuous data
dataset <- matrix(rnorm(200 * 20), nrow = 200 ) 
#the target feature is the last column of the dataset as a vector
case <- rbinom(200, 1, 0.6)
ina <- which(case == 1)
ina <- sample(ina, 100)
case[-ina] = 0 
id <- rep(1:100, 2)
target <- cbind(case, id)

results <- testIndClogit(target, dataset, xIndex = 14, csIndex = 20)
results

#run the SES algorithm using the testIndClogit conditional independence test
a <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test = "testIndClogit");
# print summary of the SES output
summary(a);



